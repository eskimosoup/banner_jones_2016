# Service
class Service < ActiveRecord::Base
  default_scope { order(title: :asc) }

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, ServiceUploader
  mount_uploader :social_share_image, ServiceUploader

  validates :title, :summary, presence: true
  validates :suggested_url, allow_blank: true, uniqueness: {
    case_sensitive: false,
    message: 'is already taken, leave blank to generate automatically'
  }

  scope :displayed, lambda {
    joins(:department)
      .where(display: true)
      .merge(Department.displayed)
  }

  belongs_to :department, counter_cache: true

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
