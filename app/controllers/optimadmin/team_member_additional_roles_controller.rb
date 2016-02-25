module Optimadmin
  class TeamMemberAdditionalRolesController < Optimadmin::ApplicationController
    before_action :set_team_member

    def index
      @team_member_additional_roles = Optimadmin::BaseCollectionPresenter.new(collection: TeamMemberAdditionalRole.where(team_member_id: @team_member.id), view_template: view_context, presenter: Optimadmin::TeamMemberAdditionalRolePresenter)
    end

    private

    def set_team_member
      @team_member = TeamMember.find(params[:team_member_id])
    end

    def team_member_additional_role_params
      params.require(:team_member_additional_role).permit(:position)
    end
  end
end
