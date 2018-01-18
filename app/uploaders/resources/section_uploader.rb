module Resources
  class SectionUploader < Optimadmin::ImageUploader
    version :index do
      process resize_to_fill: [200, 200]
    end

    version :show do
      process resize_to_fill: [675, 500]
    end

    version :square do
      process resize_to_fill: [675, 675]
    end

    version :banner do
      process resize_to_fill: [1350, 350]
    end
  end
end
