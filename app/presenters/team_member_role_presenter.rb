class TeamMemberRolePresenter < BasePresenter
  presents :team_member_role
  delegate :title, to: :team_member_role
end
