class ServiceTestimonial < ActiveRecord::Base
  belongs_to :service
  belongs_to :testimonial
end
