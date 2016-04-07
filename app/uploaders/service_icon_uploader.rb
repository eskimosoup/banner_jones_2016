class ServiceIconUploader < Optimadmin::ImageUploader
  version :small do
    process resize_to_fill: [42, 42]
  end
  version :medium do
    process resize_to_fill: [77, 77]
  end
end
