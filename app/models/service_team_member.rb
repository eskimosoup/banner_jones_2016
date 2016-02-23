class ServiceTeamMember < ActiveRecord::Base
  belongs_to :service
  belongs_to :team_member
end
