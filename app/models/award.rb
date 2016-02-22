# Award
class Award < ActiveRecord::Base
  default_scope { positioned }

  mount_uploader :image, AwardUploader

  validates :title, :image, presence: true

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true) }
end
