# Article
class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, ArticleUploader
  mount_uploader :social_share_image, SocialImageUploader

  validates :title, :summary, :content, :date, presence: true
  validates :suggested_url, allow_blank: true, uniqueness: {
    case_sensitive: false,
    message: 'is already taken, leave blank to generate automatically'
  }
  validate :future_date, if: proc { |x| x.date.present? }

  scope :displayed, -> { where('display = ? AND date <= ?', true, Date.today) }
  scope :home_page_highlight, -> { where(home_page_highlight: true).displayed }
  scope :search, ->(title) { where(title: title) }

  def future_date
    errors.add(:date, "can't be in the past") if date < Date.today
  end

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
