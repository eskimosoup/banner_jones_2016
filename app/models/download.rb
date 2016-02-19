class Download < ActiveRecord::Base
  default_scope { order(name: :asc) }

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, DownloadUploader
  mount_uploader :file, Optimadmin::DocumentUploader

  validates :name, :summary, :file, presence: true
  validates :suggested_url, allow_blank: true, uniqueness: {
    case_sensitive: false,
    message: 'is already taken, leave blank to generate automatically'
  }

  scope :positioned, -> { order(:position) }
  scope :displayed, lambda {
    joins(:download_category)
      .where(display: true)
      .merge(DownloadCategory.displayed)
  }

  belongs_to :download_category

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
