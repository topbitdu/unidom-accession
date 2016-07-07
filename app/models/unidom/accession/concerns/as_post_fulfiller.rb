module Unidom::Accession::Concerns::AsPostFulfiller

  extend ActiveSupport::Concern

  self.included do |includer|

    has_many :post_fulfillments, class_name: 'Unidom::Accession::PostFulfillment', as: :fulfiller

  end

end
