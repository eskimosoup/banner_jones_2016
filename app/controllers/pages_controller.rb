class PagesController < ApplicationController
  before_action :set_page

  def show
    return redirect_to @page, status: :moved_permanently if request.path != page_path(@page)
    @side_menus = @page.side_menus
    @team_members = TeamMember.displayed
    @services = Service.root_services.displayed.pluck(:title, :id)
    @offices = Office.unscoped.displayed.joins(:office_location).order('office_locations.name ASC')
    render layout: @page.layout
  end

  private

  def set_page
    @page = Page.displayed.friendly.find(params[:id])
  end
end
