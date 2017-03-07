shared_examples 'Unidom::Accession::Concerns::AsPostFulfilled' do |model_attributes|

  post_fulfillment_1_attribtues = {
      fulfiller_id:   SecureRandom.uuid,
      fulfiller_type: 'Unidom::Accession::Fulfiller::Mock'
    }

  post_fulfillment_2_attribtues = {
      fulfiller_id:   SecureRandom.uuid,
      fulfiller_type: 'Unidom::Accession::Fulfiller::Mock'
    }

  it_behaves_like 'has_many', model_attributes, :post_fulfillments, Unidom::Accession::PostFulfillment, [ post_fulfillment_1_attribtues, post_fulfillment_2_attribtues ]

end
