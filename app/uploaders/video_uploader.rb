class VideoUploader < Optimadmin::ImageUploader
  version :show do
    process resize_to_fill: [200, 200]
  end

  version :full do
    process resize_to_fill: [660, 350]
  end
end
