class TeamMemberAdditionalRole < ActiveRecord::Base
  default_scope { positioned }

  belongs_to :team_member
  belongs_to :team_member_role

  validates :team_member, :team_member_role, presence: true

  delegate :title, to: :team_member_role, prefix: true

  scope :positioned, -> { order(:position) }
end
