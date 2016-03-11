class ServiceIconUploader < Optimadmin::ImageUploader
  version :show do
    process resize_to_fill: [45, 45]
  end
end
