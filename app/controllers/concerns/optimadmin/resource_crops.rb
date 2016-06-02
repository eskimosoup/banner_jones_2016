module Optimadmin
  module ResourceCrops
    extend ActiveSupport::Concern

    included do
      edit_images_for Resource,
                      [
                        [:image, { show: ['fill', 200, 200], index: ['fill', 251, 153] }]
                      ]
    end
  end
end
