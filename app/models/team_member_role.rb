class TeamMemberRole < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {
    case_sensitive: false
  }

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true) }

  has_many :team_members, dependent: :nullify
end
