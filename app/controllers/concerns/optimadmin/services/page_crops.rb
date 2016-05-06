module Optimadmin
  module Services
    module PageCrops
      extend ActiveSupport::Concern

      included do
        edit_images_for ::Services::Page,
                        [
                          [:image, { show: ['fit', 200, 200], index: ['fit', 270, 124] }],
                          [:social_share_image, { show: ['fit', 1200, 600] }]
                        ]
      end
    end
  end
end
