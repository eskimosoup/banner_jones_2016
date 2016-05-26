class TeamMembersController < ApplicationController
  before_action :set_search_service, only: :search
  before_action :load_form_field_objects
  before_action :find_team_member, only: [:show, :testimonials]

  def index
    @office = Office.displayed.find(params[:office_id]) if params[:office_id].present?
    @team_members = @office.present? ? @office.team_members.displayed : TeamMember.displayed
  end

  def show
  end

  def search
    @team_members = if @service.blank?
                      TeamMember.displayed.filter(search_params.slice(:name_search, :office_id))
                    else
                      @service.team_members.displayed.filter(search_params.slice(:name_search, :office_id))
                    end

    respond_to do |format|
      format.js
      format.html { render 'team_members/index' }
    end
  end

  private

  def load_form_field_objects
    @offices = Office.displayed
    @services = Service.root_services.displayed.pluck(:title, :id)
  end

  def set_search_service
    @service = Service.displayed.find(params[:service_id]) if params[:service_id].present?
  end

  def search_params
    params.permit([:name_search, :office_id])
  end

  def find_team_member
    @team_member = TeamMember.displayed.find(params[:id])
    root_services = Service.joins(:service_team_members).where(services_team_members: { team_member_id: @team_member.id }).pluck(:id)
    @team_members = TeamMember.joins(:service_team_members).where(services_team_members: { service_id: root_services}).where.not(id: @team_member.id).limit(6)
  end
end
