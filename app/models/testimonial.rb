# Testimonial
class Testimonial < ActiveRecord::Base
  mount_uploader :image, TestimonialUploader

  validates :content, :author_name, presence: true
  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true).positioned }
end
