module Unidom::Accession::Concerns::AsPostFulfiller

  extend ActiveSupport::Concern

  included do |includer|

    has_many :post_fulfillments, class_name: 'Unidom::Accession::PostFulfillment', as:     :fulfiller
    has_many :fulfilled_posts,   through:    :post_fulfillments,                   source: :fulfilled, source_type: 'Unidom::Position::Post'

    def fulfill_post!(post, at: Time.now)
      raise ArgumentError.new('The post argument is required.') if post.blank?
      raise ArgumentError.new('The at argument is required.'  ) if at.blank?
      post_fulfillments.create! fulfilled: post, opened_at: at
    end

    def fulfill_post?(post, at: Time.now)
      raise ArgumentError.new('The post argument is required.') if post.blank?
      raise ArgumentError.new('The at argument is required.'  ) if at.blank?
      post_fulfillments.fulfilled_is(post).valid_at(now: at).exists?
    end

  end

end
