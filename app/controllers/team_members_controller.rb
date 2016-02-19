class TeamMembersController < ApplicationController
  def index
    @presented_team_members = BaseCollectionPresenter.new(collection: TeamMember.positioned.displayed, view_template: view_context, presenter: TeamMemberPresenter)
  end

  def show
    @presented_team_member = TeamMemberPresenter.new(object: TeamMember.displayed.find(params[:id]), view_context: view_template)
  end
end
