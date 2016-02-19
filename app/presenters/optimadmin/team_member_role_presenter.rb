module Optimadmin
  class TeamMemberRolePresenter < Optimadmin::BasePresenter
    presents :team_member_role
    delegate :id, :name, to: :team_member_role
  end
end
