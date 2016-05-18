module Optimadmin
  module EventCrops
    extend ActiveSupport::Concern

    included do
      edit_images_for Event,
                      [
                        [:image, {
                          show: ['fit', 975, 443],
                          index: ['fill', 436, 198]
                        }],
                        [:social_share_image, { show: ['fit', 1200, 600] }]
                      ]
    end
  end
end
