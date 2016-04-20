class ServicePageUploader < Optimadmin::ImageUploader
  version :show do
    process resize_to_fill: [200, 200]
  end
  version :index do
    process resize_to_fit: [270, 124]
  end
end
