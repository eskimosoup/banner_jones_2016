module Optimadmin
  class TeamMemberAdditionalRolePresenter < Optimadmin::BasePresenter
    presents :team_member_additional_role
    delegate :id, :team_member_role_title, to: :team_member_additional_role
  end
end
