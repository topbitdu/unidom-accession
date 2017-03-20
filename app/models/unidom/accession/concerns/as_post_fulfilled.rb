##
# As Post Fulfilled 是被履行的职位的领域逻辑关注点。

module Unidom::Accession::Concerns::AsPostFulfilled

  extend  ActiveSupport::Concern
  include Unidom::Common::Concerns::ArgumentValidation

  included do |includer|

    has_many :post_fulfillments, class_name: 'Unidom::Accession::PostFulfillment', as:     :fulfilled
    has_many :fulfiller_people,  through:    :post_fulfillments,                   source: :fulfiller, source_type: 'Unidom::Party::Person'

    ##
    # 让当前岗位在指定时间 at 开始被指定的参与者 by 履行。指定时间缺省为当前时间。如：
    # post.is_fulfilled_as_post! by: tom
    # 或者
    # post.is_fulfilled_as_post! by: tom, at: Time.now
    def is_fulfilled_as_post!(by: nil, at: Time.now)
      assert_present! :by, by
      assert_present! :at, at
      #raise ArgumentError.new('The by argument is required.') if by.blank?
      #raise ArgumentError.new('The at argument is required.') if at.blank?
      post_fulfillments.create! fulfiller: by, opened_at: at
    end

    ##
    # 判断当前岗位在指定时间 at 是否被指定的参与者 by 履行。指定时间缺省为当前时间。如：
    # post.is_fulfilled_as_post? by: tom
    # 或者
    # post.is_fulfilled_as_post? by: tom, at: Time.now
    def is_fulfilled_as_post?(by: nil, at: Time.now)
      assert_present! :by, by
      assert_present! :at, at
      #raise ArgumentError.new('The by argument is required.') if by.blank?
      #raise ArgumentError.new('The at argument is required.') if at.blank?
      post_fulfillments.fulfilled_by(by).valid_at(now: at).exists?
    end

  end

  module ClassMethods
  end

end
