module Extensions
  module OfficeLocation
    extend ActiveSupport::Concern

    included do
      # default_scope { order(:name) }
      mount_uploader :image, OfficeLocationUploader
    end

    class_methods do
    end
  end
end
