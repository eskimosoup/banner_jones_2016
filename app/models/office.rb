class Office < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, OfficeUploader

  belongs_to :office_location

  has_many :service_offices, dependent: :destroy
  has_many :services, through: :service_offices

  has_many :team_member_offices, dependent: :destroy
  has_many :team_members, through: :team_member_offices

  delegate :name, to: :office_location, prefix: true

  validates :name, :office_location, :postcode, presence: true
  validates :name, uniqueness: { scope: :office_location_id }
  validates :suggested_url, uniqueness: {
    allow_blank: true,
    case_sensitive: false
  }

  scope :displayed, lambda {
    joins(:office_location)
      .where(display: true)
      .merge(OfficeLocation.displayed)
  }

  has_many :service_offices, dependent: :destroy
  has_many :offices, through: :service_offices

  def slug_candidates
    [
      :suggested_url,
      :name,
      [:suggested_url, :name]
    ]
  end

  def should_generate_new_friendly_id?
    slug.blank? || suggested_url_changed? || name_changed?
  end
end
