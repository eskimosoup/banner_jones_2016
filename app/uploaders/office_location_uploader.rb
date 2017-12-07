class OfficeLocationUploader < Optimadmin::ImageDefaultsUploader
  version :show do
    process resize_to_fill: [1920, 723]
  end
end
