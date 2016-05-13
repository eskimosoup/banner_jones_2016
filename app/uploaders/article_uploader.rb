class ArticleUploader < Optimadmin::ImageUploader
  version :index do
    process resize_to_fill: [439, 198]
  end
  version :home do
    process resize_to_fill: [270, 200]
  end
  version :show do
    process resize_to_fill: [200, 200]
  end
end
