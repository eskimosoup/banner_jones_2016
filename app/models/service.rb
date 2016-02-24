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
    # joins(:department)
    where(display: true)
    #  .merge(Department.displayed)
  }

  belongs_to :department, counter_cache: true

  has_many :service_articles, dependent: :destroy
  has_many :articles, -> { displayed }, through: :service_articles

  has_many :service_downloads, dependent: :destroy
  has_many :downloads, -> { displayed }, through: :service_downloads

  has_many :service_events, dependent: :destroy
  has_many :events, -> { displayed }, through: :service_events

  has_many :service_faqs, dependent: :destroy
  has_many :frequently_asked_questions, -> { displayed }, through: :service_faqs

  has_many :service_offices, dependent: :destroy
  has_many :offices, -> { displayed }, through: :service_offices

  has_many :service_team_members, dependent: :destroy
  has_many :team_members, -> { displayed }, through: :service_team_members

  has_many :service_testimonials, dependent: :destroy
  has_many :testimonials, -> { displayed }, through: :service_testimonials

  has_many :service_related_services, dependent: :destroy
  has_many :related_services, -> { displayed }, through: :service_related_services

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
