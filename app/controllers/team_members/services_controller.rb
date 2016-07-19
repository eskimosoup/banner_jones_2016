module TeamMembers
  class ServicesController < ApplicationController
    before_action :find_member_service

    include ResourceHelper, TwitterHelper

    def show
      return redirect_to audience_team_member_service_path(@audience, @service), status: :moved_permanently if request.path != audience_team_member_service_path(@audience, @service)
      @team_members = @service.team_members.displayed
      @current_service = @service
      render 'team_members/index'
    end

    private

    def find_member_service
      @audience = Audience.displayed.friendly.find(params[:audience_id])
      @service = @audience.services.displayed.friendly.find(params[:id])
    end
  end
end
