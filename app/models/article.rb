# Article
class Article < ActiveRecord::Base
  include DisplayStatus

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, ArticleUploader
  mount_uploader :social_share_image, SocialImageUploader

  validates :title, :summary, :content, presence: true
  validates :suggested_url, allow_blank: true, uniqueness: {
    case_sensitive: false,
    message: 'is already taken, leave blank to generate automatically'
  }

  scope :displayed, lambda {
    joins(:article_category)
      .published
      .merge(ArticleCategory.displayed)
  }
  scope :home_page_highlight, -> { where(home_page_highlight: true).displayed }

  belongs_to :article_category
  belongs_to :team_member

  has_many :service_articles, dependent: :destroy
  has_many :services, -> { displayed }, through: :service_articles

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
