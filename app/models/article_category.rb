# ArticleCategory
class ArticleCategory < ActiveRecord::Base
  default_scope { order(name: :asc) }

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :suggested_url, allow_blank: true, uniqueness: {
    case_sensitive: false,
    message: 'is already taken, leave blank to generate automatically'
  }

  scope :displayed, -> { where(display: true) }

  has_many :articles, dependent: :nullify

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
