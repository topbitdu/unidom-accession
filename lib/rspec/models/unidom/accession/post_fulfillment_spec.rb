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

    it_behaves_like 'scope', :part_time, [
      { attributes_collection: [ model_attributes                        ], count_diff: 0, args: [ true  ] },
      { attributes_collection: [ model_attributes                        ], count_diff: 1, args: [ false ] },
      { attributes_collection: [ model_attributes.merge(part_time: true) ], count_diff: 1, args: [ true  ] },
      { attributes_collection: [ model_attributes.merge(part_time: true) ], count_diff: 0, args: [ false ] } ]

    it_behaves_like 'scope', :temporary, [
      { attributes_collection: [ model_attributes                        ], count_diff: 0, args: [ true  ] },
      { attributes_collection: [ model_attributes                        ], count_diff: 1, args: [ false ] },
      { attributes_collection: [ model_attributes.merge(temporary: true) ], count_diff: 1, args: [ true  ] },
      { attributes_collection: [ model_attributes.merge(temporary: true) ], count_diff: 0, args: [ false ] } ]

  end

end
