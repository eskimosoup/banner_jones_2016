class TeamMembersController < ApplicationController
  before_action :set_search_service, only: :search

  def index
    @presented_team_members = BaseCollectionPresenter.new(collection: TeamMember.positioned.displayed, view_template: view_context, presenter: TeamMemberPresenter)
  end

  def show
    @presented_team_member = TeamMemberPresenter.new(object: TeamMember.displayed.find(params[:id]), view_context: view_template)
  end

  def search
    @team_members = if @service.blank?
                      TeamMember.positioned.displayed.name_search(params[:name])
                    else
                      @service.team_members.name_search(params[:name])
                    end

    respond_to do |format|
      format.js
    end
  end

  private

  def set_search_service
    @service = Service.displayed.find(params[:service_id]) if params[:service_id].present?
  end
end
