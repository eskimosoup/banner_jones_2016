class TeamMembersController < ApplicationController
  before_action :set_search_service, only: :search

  def index
    @team_members = TeamMember.displayed
    @offices = Office.displayed
    @services = Service.root_services.displayed.pluck(:title, :id)
  end

  def show
    @presented_team_member = TeamMemberPresenter.new(object: TeamMember.displayed.find(params[:id]), view_context: view_template)
  end

  def search
    @team_members = if @service.blank?
                      TeamMember.displayed.filter(search_params.slice(:name_search, :office_id))
                    else
                      @service.team_members.displayed.filter(search_params.slice(:name_search, :office_id))
                    end

    respond_to do |format|
      format.js
    end
  end

  private

  def set_search_service
    @service = Service.displayed.find(params[:service_id]) if params[:service_id].present?
  end

  def search_params
    params.permit([:name_search, :office_id])
  end
end
