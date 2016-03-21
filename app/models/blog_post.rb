# BlogPost
class BlogPost < ActiveRecord::Base
  include DisplayStatus

  default_scope { order(title: :asc) }

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, BlogPostUploader
  mount_uploader :social_share_image, SocialImageUploader

  validates :title, :date, :summary, :content, presence: true
  validates :suggested_url, allow_blank: true, uniqueness: {
    case_sensitive: false,
    message: 'is already taken, leave blank to generate automatically'
  }
  validate :future_date, if: proc { |x| x.date.present? }
  validates :blog_category, presence: true, if: proc { |x| x.new_record? }

  scope :displayed, lambda {
    joins(:blog_category)
      .published
      .merge(BlogCategory.displayed)
  }

  belongs_to :team_member
  belongs_to :blog_category

  def future_date
    errors.add(:date, 'can not be in the past') if date < Date.today
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
