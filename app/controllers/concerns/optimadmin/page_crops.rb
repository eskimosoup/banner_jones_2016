module Optimadmin
  module PageCrops
    extend ActiveSupport::Concern

    included do
      edit_images_for Page,
                      [
                        [:image, { show: ['fit', 600, 264] }],
                        [:social_share_image, { show: ['fit', 1200, 600] }]
                      ]
    end
  end
end
