module Extensions
  module OfficeLocation
    extend ActiveSupport::Concern

    included do
      mount_uploader :image, OfficeLocationUploader
    end

    class_methods do
    end
  end
end
