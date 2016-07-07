module Unidom::Accession::Concerns::AsPostFulfilled

  extend ActiveSupport::Concern

  self.included do |includer|

    has_many :post_fulfillments, class_name: 'Unidom::Accession::PostFulfillment', as: :fulfilled

  end

end
