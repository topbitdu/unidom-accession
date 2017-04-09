shared_examples 'Unidom::Accession::PostFulfillment' do |model_attributes, fulfilled, fulfiller|

  before :each do
  end

  after :each do
  end

  context do
    it_behaves_like 'assert_present!', described_class, :fulfill!, [ { fulfilled: fulfilled, fulfiller: fulfiller, opened_at: Time.now } ], [ :fulfilled, :fulfiller, :opened_at ]
  end

end
