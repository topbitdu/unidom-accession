##
# As Post Fulfiller 是履行职位的参与者的领域逻辑关注点。

module Unidom::Accession::Concerns::AsPostFulfiller

  extend ActiveSupport::Concern

  included do |includer|

    has_many :post_fulfillments, class_name: 'Unidom::Accession::PostFulfillment', as:     :fulfiller
    has_many :fulfilled_posts,   through:    :post_fulfillments,                   source: :fulfilled, source_type: 'Unidom::Position::Post'

    ##
    # 让当前参与者在指定时间 at 开始履行岗位 post 。指定时间缺省为当前时间。
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

  module ClassMethods
  end

end
