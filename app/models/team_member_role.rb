class TeamMemberRole < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {
    case_sensitive: false
  }

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(status: :published) }

  has_many :team_members, -> { displayed }, dependent: :nullify

  has_many :team_member_additional_roles, dependent: :destroy
end
