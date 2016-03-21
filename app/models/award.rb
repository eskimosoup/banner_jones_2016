# Award
class Award < ActiveRecord::Base
  include DisplayStatus

  default_scope { positioned }

  mount_uploader :image, AwardUploader

  validates :title, :image, presence: true

  scope :displayed, -> { published }

  scope :positioned, -> { order(:position) }
end
