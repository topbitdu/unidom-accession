module Unidom::Accession::Concerns::AsPostFulfilled

  extend ActiveSupport::Concern

  self.included do |includer|

    has_many :post_fulfillments, class_name: 'Unidom::Accession::PostFulfillment', as:     :fulfilled
    has_many :fulfiller_people,  through:    :post_fulfillments,                   source: :fulfiller, source_type: 'Unidom::Party::Person'

    #def is_fulfilled_as_post!(fulfiller, opened_at: Time.now)
    #  post_fulfillments.create! fulfiller: fulfiller, opened_at: opened_at
    #end

  end

end
