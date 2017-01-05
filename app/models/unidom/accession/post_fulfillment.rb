##
# Post Fulfillment 是岗位履行。

class Unidom::Accession::PostFulfillment < Unidom::Accession::ApplicationRecord

  self.table_name = 'unidom_post_fulfillments'

  include Unidom::Common::Concerns::ModelExtension

  belongs_to :fulfiller, polymorphic: true
  belongs_to :fulfilled, polymorphic: true

  scope :fulfilled_by, ->(fulfiller) { where fulfiller: fulfiller }
  scope :fulfilled_is, ->(fulfilled) { where fulfilled: fulfilled }

  scope :part_time, ->(part_time = true) { where part_time: part_time }
  scope :temporary, ->(temporary = true) { where temporary: temporary }

  def self.fulfill!(fulfilled: nil, fulfiller: nil, opened_at: Time.now)
    raise ArgumentError.new('Argument fulfilled is required.') if fulfilled.blank?
    raise ArgumentError.new('Argument fulfiller is required.') if fulfiller.blank?
    raise ArgumentError.new('Argument opened_at is required.') if opened_at.blank?
    self.create! fulfiller: fulfiller, fulfilled: fulfilled, opened_at: opened_at
  end

end
