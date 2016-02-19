# Article
class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, ArticleUploader
  mount_uploader :social_share_image, SocialImageUploader

  validates :title, :summary, :content, :date, presence: true
  validate :future_date, if: proc { |x| x.date.present? && x.new_record? }
  validates :suggested_url, allow_blank: true, uniqueness: {
    case_sensitive: false,
    message: 'is already taken, leave blank to generate automatically'
  }

  scope :displayed, lambda {
    joins(:article_category)
      .where('articles.display = ? AND date <= ?', true, Date.today)
      .merge(ArticleCategory.displayed)
  }
  scope :home_page_highlight, -> { where(home_page_highlight: true).displayed }
  scope :search, ->(title) { where(title: title) }

  belongs_to :article_category
  belongs_to :team_member

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
