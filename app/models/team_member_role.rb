class TeamMemberRole < ActiveRecord::Base
  validates :name, presence: true, uniqueness: {
    case_sensitive: false
  }

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true) }

  has_many :team_members, -> { displayed }, dependent: :nullify
end
