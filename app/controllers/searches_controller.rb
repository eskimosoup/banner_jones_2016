class SearchesController < ApplicationController
  layout 'landing_page_design'

  def new
    @facade = SearchFacade.new(params[:q], params[:page])
    @locations = OfficeLocation.displayed
  end
end
