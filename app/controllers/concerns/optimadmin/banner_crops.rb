module Optimadmin
  module BannerCrops
    extend ActiveSupport::Concern

    included do
      edit_images_for Banner,
                      [
                        [:image, { homepage: ['fill', 200, 200] }]
                      ]
    end
  end
end
