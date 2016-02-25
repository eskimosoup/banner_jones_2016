class ServiceRelatedService < ActiveRecord::Base
  default_scope { positioned }

  belongs_to :service
  belongs_to :related_service, class_name: 'Service'

  validates :service, :related_service, presence: true

  delegate :name, to: :related_service, prefix: true

  scope :positioned, -> { order(:position) }
end
