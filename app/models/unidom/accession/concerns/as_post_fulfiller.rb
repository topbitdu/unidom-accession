module Unidom::Accession::Concerns::AsPostFulfiller

  extend ActiveSupport::Concern

  self.included do |includer|

    has_many :post_fulfillments, class_name: 'Unidom::Accession::PostFulfillment', as:     :fulfiller
    has_many :fulfilled_posts,   through:    :post_fulfillments,                   source: :fulfilled, source_type: 'Unidom::Position::Post'

    #def fulfill_post!(fulfilled, opened_at: Time.now)
    #  post_fulfillments.create! fulfilled: fulfilled, opened_at: opened_at
    #end

  end

end
