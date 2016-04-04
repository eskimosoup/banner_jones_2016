module Optimadmin
  module OfficeCrops
    extend ActiveSupport::Concern

    included do
      edit_images_for Office,
                      [
                        [:image, { show: ['fit', 200, 200], index: ['fill', 200, 200] }]
                      ]
    end
  end
end
