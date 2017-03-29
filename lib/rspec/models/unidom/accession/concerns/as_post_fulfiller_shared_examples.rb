shared_examples 'Unidom::Accession::Concerns::AsPostFulfiller' do |model_attributes, post|

  before :each do
    @post_fulfiller = described_class.create! model_attributes
  end

  after :each do
  end

  context '#fulfill_post!' do

    it "should be able to fulfill post #{post.inspect}" do
      post_fulfillment = @post_fulfiller.fulfill_post! post
      expect(post_fulfillment).to     be_present
      expect(post_fulfillment).to     be_a(Unidom::Accession::PostFulfillment)
      expect(post_fulfillment).not_to be_new_record
    end

    it "should be able to fulfill post #{post.inspect}, at #{Time.now.inspect}" do
      post_fulfillment = @post_fulfiller.fulfill_post! post, at: Time.now
      expect(post_fulfillment).to     be_present
      expect(post_fulfillment).to     be_a(Unidom::Accession::PostFulfillment)
      expect(post_fulfillment).not_to be_new_record
    end

  end

  context '#fulfill_post?' do

    it "should be able to fulfill post #{post.inspect}" do
      expect(@post_fulfiller.fulfill_post? post).to be_falsey
      @post_fulfiller.fulfill_post!        post
      expect(@post_fulfiller.fulfill_post? post).to be_truthy
    end

    it "should be able to fulfill post #{post.inspect}, at #{Time.now.inspect}" do
      expect(@post_fulfiller.fulfill_post? post, at: Time.now).to be_falsey
      @post_fulfiller.fulfill_post!        post, at: Time.now
      expect(@post_fulfiller.fulfill_post? post, at: Time.now).to be_truthy
    end

  end

  context do

    post_fulfillment_1_attribtues = {
        fulfilled_id:   SecureRandom.uuid,
        fulfilled_type: 'Unidom::Accession::Fulfilled::Mock'
      }

    post_fulfillment_2_attribtues = {
        fulfilled_id:   SecureRandom.uuid,
        fulfilled_type: 'Unidom::Accession::Fulfilled::Mock'
      }

    it_behaves_like 'has_many', model_attributes, :post_fulfillments, Unidom::Accession::PostFulfillment, [ post_fulfillment_1_attribtues, post_fulfillment_2_attribtues ]

    post_fulfiller = described_class.create! model_attributes
    it_behaves_like 'assert_present!', post_fulfiller, :fulfill_post!, [ post, { at: Time.now } ], [ { 0 => :post }, :at ]
    it_behaves_like 'assert_present!', post_fulfiller, :fulfill_post?, [ post, { at: Time.now } ], [ { 0 => :post }, :at ]

  end

end
