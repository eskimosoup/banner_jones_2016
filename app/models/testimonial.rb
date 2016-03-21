# Testimonial
class Testimonial < ActiveRecord::Base
  include DisplayStatus

  mount_uploader :image, TestimonialUploader

  validates :content, :author_name, presence: true

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { published.positioned }

  has_many :service_testimonials, dependent: :destroy
  has_many :testimonials, through: :service_testimonials
end
