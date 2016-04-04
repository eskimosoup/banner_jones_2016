# Use this uploader for social share images (i.e. OpenGraph)
class SocialImageUploader < Optimadmin::ImageUploader
  version :show do
    process resize_to_fill: [1200, 630]
  end
end
