##
# As Post Fulfiller 是履行职位的参与者的领域逻辑关注点。

module Unidom::Accession::Concerns::AsPostFulfiller

  extend  ActiveSupport::Concern
  include Unidom::Common::Concerns::ArgumentValidation

  included do |includer|

    has_many :post_fulfillments, class_name: 'Unidom::Accession::PostFulfillment', as:     :fulfiller
    has_many :fulfilled_posts,   through:    :post_fulfillments,                   source: :fulfilled, source_type: 'Unidom::Position::Post'

    ##
    # 让当前参与者在指定时间 at 开始履行岗位 post 。指定时间缺省为当前时间。如：
    # selected_person.fulfill_post! post
    # 或者
    # selected_person.fulfill_post! post, at: Time.now-1.day
    def fulfill_post!(post, at: Time.now)

      assert_present! :post, post
      assert_present! :at,   at

      post_fulfillments.create! fulfilled: post, opened_at: at

    end

    ##
    # 判断当前参与者在指定时间 at 是否被履行制定的岗位 post 。指定时间缺省为当前时间。如：
    # post.fulfill_post? post
    # 或者
    # post.fulfill_post? post, at: Time.now
    def fulfill_post?(post, at: Time.now)

      assert_present! :post, post
      assert_present! :at,   at

      post_fulfillments.fulfilled_is(post).valid_at(now: at).exists?

    end

  end

  module ClassMethods
  end

end
