describe Unidom::Accession::PostFulfillment, type: :model do

  before :each do
  end

  after :each do
  end

=begin
  context '.validates' do

    model_attributes = { name: 'Tim' }

    it_behaves_like 'validates', model_attributes, :name,
      {             } => 0,
      { name: nil   } => 2,
      { name: ''    } => 2,
      { name: 'A'   } => 1,
      { name: 'AA'  } => 0,
      { name: 'AAA' } => 0,
      { name: '0'   } => 1,
      { name: '00'  } => 0,
      { name: '000' } => 0,
      { name: 0     } => 1,
      { name: 'A'*(described_class.columns_hash['name'].limit-1) } => 0,
      { name: 'A'*described_class.columns_hash['name'].limit     } => 0,
      { name: 'A'*(described_class.columns_hash['name'].limit+1) } => 1

  end
=end

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
