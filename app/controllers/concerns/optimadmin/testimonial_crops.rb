module Optimadmin
  module TestimonialCrops
    extend ActiveSupport::Concern

    included do
      edit_images_for Testimonial,
                      [
                        [:image, { show: ['fit', 200, 200], index: ['fill', 40, 40] }]
                      ]
    end
  end
end
