module Optimadmin
  class TeamMembersController < Optimadmin::ApplicationController
    before_action :set_team_member, only: [:show, :edit, :update, :destroy]

    edit_images_for TeamMember, [[:image, { show: ['fill', 200, 200], index: ['fill', 200, 200] }]]

    def index
      @team_members = Optimadmin::BaseCollectionPresenter.new(collection: TeamMember.positioned.name_search(params[:search]).page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::TeamMemberPresenter)
    end

    def show
    end

    def new
      @team_member = TeamMember.new
    end

    def edit
    end

    def create
      @team_member = TeamMember.new(team_member_params)
      if @team_member.save
        redirect_to team_members_url, notice: 'Team member was successfully created.'
      else
        render :new
      end
    end

    def update
      if @team_member.update(team_member_params)
        redirect_to team_members_url, notice: 'Team member was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @team_member.destroy
      redirect_to team_members_url, notice: 'Team member was successfully destroyed.'
    end

  private


    def set_team_member
      @team_member = TeamMember.find(params[:id])
    end

    def team_member_params
      params.require(:team_member).permit(:position, :forename, :surname,
                                  :team_member_role_id,
                                  :image, :remote_image_url, :remove_image,
                                  :image_cache, :primary_telephone,
                                  :secondary_telephone, :email_address,
                                  :display_from, :display_until, :display,
                                  :specialisms, :has_vcard_download, :profile,
                                  :google_plus, :twitter_link, :facebook_link,
                                  :mobile_number, :dx_number)
    end
  end
end
