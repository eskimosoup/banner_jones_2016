module Optimadmin
  module TeamMemberCrops
    extend ActiveSupport::Concern

    included do
      edit_images_for TeamMember,
                      [
                        [:image, {
                          small: ['fill', 45, 45],
                          slider: ['fill', 117, 146],
                          navigation: ['fill', 130, 195],
                          show: ['fill', 200, 200],
                          index: ['fill', 200, 200]
                        }]
                      ]
    end
  end
end
