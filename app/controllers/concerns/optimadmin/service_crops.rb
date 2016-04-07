module Optimadmin
  module ServiceCrops
    extend ActiveSupport::Concern

    included do
      edit_images_for Service,
                      [
                        [:image, { show: ['fit', 200, 200], index: ['fill', 200, 200] }],
                        [:icon, { small: ['fit', 42, 42], medium: ['fit', 77, 77] }],
                        [:social_share_image, { show: ['fit', 1200, 600] }]
                      ]
    end
  end
end
