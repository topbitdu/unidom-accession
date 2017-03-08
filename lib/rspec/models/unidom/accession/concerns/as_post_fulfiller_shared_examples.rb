shared_examples 'Unidom::Accession::Concerns::AsPostFulfiller' do |model_attributes|

  post_fulfillment_1_attribtues = {
      fulfilled_id:   SecureRandom.uuid,
      fulfilled_type: 'Unidom::Accession::Fulfilled::Mock'
    }

  post_fulfillment_2_attribtues = {
      fulfilled_id:   SecureRandom.uuid,
      fulfilled_type: 'Unidom::Accession::Fulfilled::Mock'
    }

  it_behaves_like 'has_many', model_attributes, :post_fulfillments, Unidom::Accession::PostFulfillment, [ post_fulfillment_1_attribtues, post_fulfillment_2_attribtues ]

end
