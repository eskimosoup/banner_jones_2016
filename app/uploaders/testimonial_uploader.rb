class TestimonialUploader < Optimadmin::ImageUploader
  version :show do
    process resize_to_fill: [40, 40]
  end
end
