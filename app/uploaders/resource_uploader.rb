class ResourceUploader < Optimadmin::ImageUploader
  version :index do
    process resize_to_fill: [251, 153]
  end
  version :show do
    process resize_to_fill: [200, 200]
  end
end
