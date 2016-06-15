module Optimadmin
  module ArticleCrops
    extend ActiveSupport::Concern

    included do
      edit_images_for Article,
                      [
                        [:image, {
                          show: ['fill', 975, 443],
                          home: ['fill', 270, 200],
                          sidebar: ['fill', 270, 124],
                          index: ['fill', 436, 198]
                        }],
                        [:social_share_image, {
                          show: ['fit', 1200, 600]
                        }]
                      ]
    end
  end
end
