module Extensions
  module OfficeLocation
    extend ActiveSupport::Concern

    included do
      mount_uploader :image, OfficeLocationUploader

      has_many :services, through: :offices
      has_many :team_members, through: :offices
      has_many :testimonials, through: :team_members
      has_many :resources, -> { uniq }, through: :services
      has_many :articles, -> { uniq }, through: :services
    end

    class_methods do
    end
  end
end
