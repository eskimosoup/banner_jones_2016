class TeamMemberOffice < ActiveRecord::Base
  belongs_to :team_member
  belongs_to :office

  validates :team_member, :office, presence: true
end
