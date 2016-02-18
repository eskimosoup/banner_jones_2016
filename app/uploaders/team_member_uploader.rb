class TeamMemberUploader < Optimadmin::ImageUploader

  version :index do
    process resize_to_fill: [200, 200]
  end

  version :show do
    process resize_to_fill: [200, 200]
  end

end
