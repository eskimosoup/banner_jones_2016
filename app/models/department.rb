# Department
class Department < ActiveRecord::Base
  default_scope { order(title: :asc) }

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, DepartmentUploader
  mount_uploader :social_share_image, SocialImageUploader

  validates :title, presence: true
  validates :suggested_url, allow_blank: true, uniqueness: {
    case_sensitive: false,
    message: 'is already taken, leave blank to generate automatically'
  }

  scope :displayed, lambda {
    joins(:audience)
      .where(display: true)
      .merge(Audience.displayed)
  }

  belongs_to :audience, counter_cache: true
  has_many :services, -> { displayed }, dependent: :destroy

  def slug_candidates
    [
      :suggested_url,
      :title,
      [:suggested_url, :title]
    ]
  end

  def should_generate_new_friendly_id?
    slug.blank? || suggested_url_changed? || title_changed?
  end
end
