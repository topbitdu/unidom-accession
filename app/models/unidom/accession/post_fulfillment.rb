# Post Fulfillment 是岗位履行。

class Unidom::Accession::PostFulfillment < ActiveRecord::Base

  self.table_name = 'unidom_post_fulfillments'

  include Unidom::Common::Concerns::ModelExtension

  belongs_to :fulfiller, polymorphic: true
  belongs_to :fulfilled, polymorphic: true

  scope :fulfilled_by, ->(fulfiller) { where fulfiller: fulfiller }
  scope :fulfilled_is, ->(fulfilled) { where fulfilled: fulfilled }

  def self.fulfill!(fulfiller, fulfilled, opened_at = Time.now)
    self.create! fulfiller: fulfiller, fulfilled: fulfilled, opened_at: opened_at
  end

end
