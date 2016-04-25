# Banner
class Banner < ActiveRecord::Base
  default_scope { positioned }

  mount_uploader :image, Optimadmin::DocumentUploader

  validates :image, presence: true
  validate :button_text_presence

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true) }

  def button_text_presence
    if button_text.present? && button_link.blank?
      errors.add(:button_link, "can't be blank if button text is set")
    elsif button_text.blank? && button_link.present?
      errors.add(:button_text, "can't be blank if button link is set")
    end
  end
end
