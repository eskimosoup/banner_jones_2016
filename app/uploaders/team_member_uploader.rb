class TeamMemberUploader < Optimadmin::ImageUploader
  version :small do
    process resize_to_fill: [45, 45]
  end

  version :slider do
    process resize_to_fill: [117, 146]
  end

  version :index do
    process resize_to_fill: [200, 200]
  end

  version :show do
    process resize_to_fill: [200, 200]
  end
end
