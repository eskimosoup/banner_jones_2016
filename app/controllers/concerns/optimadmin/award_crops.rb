module Optimadmin
  module AwardCrops
    extend ActiveSupport::Concern

    included do
      edit_images_for Award,
                      [
                        [:image, { show: ['fit', 194, 141], index: ['fill', 200, 200] }]
                      ]
    end
  end
end
