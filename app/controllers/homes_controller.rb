class HomesController < ApplicationController
  def show
    @facade = HomeFacade.new
    @services ||= Service.root_services.displayed.order(:title).pluck(:title, :id)
    @offices ||= Office.displayed
  end
end
