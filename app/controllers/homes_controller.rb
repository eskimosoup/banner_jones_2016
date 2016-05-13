class HomesController < ApplicationController
  def show
    @facade = HomeFacade.new
  end
end
