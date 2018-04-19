class TeamMemberUploader < Optimadmin::ImageUploader
  version :small do
    process resize_to_fill: [45, 45]
  end

  version :slider do
    process resize_to_fill: [117, 146]
  end

  version :slider_service do
    process resize_to_fill: [250, 250]
  end

  version :navigation do
    process resize_to_fill: [130, 195]
  end

  version :related_footer do
    process resize_to_fill: [91, 91]
  end

  version :index do
    process resize_to_fill: [220, 220]
  end

  version :show do
    process resize_to_fill: [296, 296]
  end
end
