class TeamMemberAdditionalRolePresenter < BasePresenter
  presents :team_member_additional_role
  delegate :id, to: :team_member_additional_role
end
