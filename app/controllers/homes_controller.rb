class HomesController < ApplicationController
  def show
    @facade = HomeFacade.new
    @services ||= Service.root_services.displayed.order(:title).pluck(:title, :id)
    @offices ||= Office.includes(:office_location).displayed

    render layout: 'landing_page_design'
  end
end
