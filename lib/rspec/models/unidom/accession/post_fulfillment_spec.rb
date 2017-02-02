describe Unidom::Accession::PostFulfillment, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      fulfilled_id:   SecureRandom.uuid,
      fulfilled_type: 'Unidom::Accession::Fulfilled::Mock',
      fulfiller_id:   SecureRandom.uuid,
      fulfiller_type: 'Unidom::Accession::Fulfiller::Mock'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
