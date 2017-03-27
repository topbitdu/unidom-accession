shared_examples 'Unidom::Accession::Concerns::AsPostFulfilled' do |model_attributes, post_fulfiller|

  before :each do
    @post = described_class.create! model_attributes
  end

  after :each do
  end

  context '#is_fulfilled_as_post!' do

    it "should be able to be fulfilled as post by #{post_fulfiller.inspect}" do
      post_fulfillment = @post.is_fulfilled_as_post! by: post_fulfiller
      expect(post_fulfillment).to     be_present
      expect(post_fulfillment).to     be_a(Unidom::Accession::PostFulfillment)
      expect(post_fulfillment).not_to be_new_record
    end

    it "should be able to be fulfilled as post by #{post_fulfiller.inspect}, at #{Time.now.inspect}" do
      post_fulfillment = @post.is_fulfilled_as_post! by: post_fulfiller, at: Time.now
      expect(post_fulfillment).to     be_present
      expect(post_fulfillment).to     be_a(Unidom::Accession::PostFulfillment)
      expect(post_fulfillment).not_to be_new_record
    end

  end

  context '#is_fulfilled_as_post?' do

    it "should be able to be fulfilled as post by #{post_fulfiller.inspect}" do
      expect(@post.is_fulfilled_as_post? by: post_fulfiller).to be_falsey
      @post.is_fulfilled_as_post!        by: post_fulfiller
      expect(@post.is_fulfilled_as_post? by: post_fulfiller).to be_truthy
    end

    it "should be able to be fulfilled as post by #{post_fulfiller.inspect}, at #{Time.now.inspect}" do
      expect(@post.is_fulfilled_as_post? by: post_fulfiller).to be_falsey
      @post.is_fulfilled_as_post!        by: post_fulfiller, at: Time.now
      expect(@post.is_fulfilled_as_post? by: post_fulfiller).to be_truthy
    end

  end

  context do

    post_fulfillment_1_attribtues = {
        fulfiller_id:   SecureRandom.uuid,
        fulfiller_type: 'Unidom::Accession::Fulfiller::Mock'
      }

    post_fulfillment_2_attribtues = {
        fulfiller_id:   SecureRandom.uuid,
        fulfiller_type: 'Unidom::Accession::Fulfiller::Mock'
      }

    it_behaves_like 'has_many', model_attributes, :post_fulfillments, Unidom::Accession::PostFulfillment, [ post_fulfillment_1_attribtues, post_fulfillment_2_attribtues ]

    post = described_class.create! model_attributes
    it_behaves_like 'assert_present!', post, :is_fulfilled_as_post!, [ { by: post_fulfiller, at: Time.now } ], [ :by, :at ]
    it_behaves_like 'assert_present!', post, :is_fulfilled_as_post?, [ { by: post_fulfiller, at: Time.now } ], [ :by, :at ]

  end

end
