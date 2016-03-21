# BlogCategory
class BlogCategory < ActiveRecord::Base
  include DisplayStatus

  default_scope { order(title: :asc) }

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :suggested_url, allow_blank: true, uniqueness: {
    case_sensitive: false,
    message: 'is already taken, leave blank to generate automatically'
  }

  belongs_to :association_related

  scope :displayed, -> { published }

  has_many :blog_posts, -> { displayed }, dependent: :nullify

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
