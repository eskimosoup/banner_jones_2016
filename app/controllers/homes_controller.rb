class HomesController < ApplicationController
  def show
    @facade = HomeFacade.new
    @services ||= Service.displayed
    @offices ||= Office.displayed
  end
end
