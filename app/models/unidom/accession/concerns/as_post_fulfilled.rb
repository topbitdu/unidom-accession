module Unidom::Accession::Concerns::AsPostFulfilled

  extend ActiveSupport::Concern

  included do |includer|

    has_many :post_fulfillments, class_name: 'Unidom::Accession::PostFulfillment', as:     :fulfilled
    has_many :fulfiller_people,  through:    :post_fulfillments,                   source: :fulfiller, source_type: 'Unidom::Party::Person'

    #def is_fulfilled_as_post!(by: nil, opened_at: Time.now)
    #  raise ArgumentError.new('The argument "by" is required.')        if by.blank?
    #  raise ArgumentError.new('The argument "opened_at" is required.') if opened_at.blank?
    #  post_fulfillments.create! fulfiller: by, opened_at: opened_at
    #end

    def is_fulfilled_as_post!(by: nil, at: Time.now)
      raise ArgumentError.new('The by argument is required.') if by.blank?
      raise ArgumentError.new('The at argument is required.') if at.blank?
      post_fulfillments.create! fulfiller: by, opened_at: at
    end

  end

end
