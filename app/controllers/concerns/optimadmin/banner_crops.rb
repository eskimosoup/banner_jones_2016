module Optimadmin
  module BannerCrops
    extend ActiveSupport::Concern

    included do
      edit_images_for Banner,
                      [
                        [:image, { homepage: ['fill', 1920, 723] }]
                      ]
    end
  end
end
