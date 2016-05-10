class PageUploader < Optimadmin::ImageUploader
  version :show do
    process resize_to_fill: [600, 264]
  end
end
