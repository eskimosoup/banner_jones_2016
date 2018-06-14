class SearchesController < ApplicationController
  def new
    @facade = SearchFacade.new(params[:q], params[:page])
    @locations = OfficeLocation.displayed
  end
end
