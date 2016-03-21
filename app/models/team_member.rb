class TeamMember < ActiveRecord::Base
  default_scope { positioned }

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
  validate :additional_role_not_containing_role

  scope :positioned, -> { order(:position) }

  # http://stackoverflow.com/a/11219778
  scope :displayed, lambda {
    joins(:team_member_role)
      .where(status: :published)
      .positioned
      .merge(TeamMemberRole.displayed)
  }

  scope :name_search, lambda { |keywords|
    where("coalesce(forename, '') || ' ' || coalesce(surname, '') ilike '%'
          || ? || '%'", keywords) if keywords
  }

  belongs_to :team_member_role

  has_many :offices, through: :team_member_offices
  has_many :team_member_offices, dependent: :destroy

  has_many :team_member_additional_roles, dependent: :destroy
  has_many :additional_roles, through: :team_member_additional_roles, source: :team_member_role

  has_many :articles, dependent: :nullify
  has_many :blog_posts, dependent: :nullify

  has_many :service_team_members, dependent: :destroy
  has_many :services, through: :service_team_members

  has_many :departments

  def additional_role_not_containing_role
    errors.add(:additional_roles, 'can not contain primary role') if additional_roles.present? && additional_roles.map(&:id).include?(team_member_role.id)
  end

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
