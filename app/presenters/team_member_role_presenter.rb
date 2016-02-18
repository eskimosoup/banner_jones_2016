class TeamMemberRolePresenter < BasePresenter
  presents :team_member_role
  delegate :name, to: :team_member_role
end
