class TeamMember < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, TeamMemberUploader

  validates :forename, :surname, presence: true
  validates :suggested_url,
              allow_blank: true,
              uniqueness: {
                case_sensitive: false,
                message: 'is already taken, leave blank to generate automatically'
              }

  scope :positioned, -> { order(:position) }
  # http://stackoverflow.com/a/11219778
  scope :displayed, -> { where('(display_from <= :today OR display_from IS NULL) AND (display_until >= :today OR display_until IS NULL) AND (display = :true)', today: Time.now, true: true) }
  scope :name_search, ->(keywords) { where("coalesce(forename, '') || ' ' || coalesce(surname, '') ilike '%' || ? || '%'", keywords) if keywords }

  belongs_to :team_member_role

  def slug_candidates
    [
      :suggested_url,
      [:forename, :surname],
      [:suggested_url, :forename, :surname]
    ]
  end

  def should_generate_new_friendly_id?
    slug.blank? || suggested_url_changed? || forename_changed? || surname_changed?
  end
end
