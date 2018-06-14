class OfficeLocationsController < ApplicationController
  def show
    @office_location = find_office_location
    @offices = @office_location.offices.displayed
    @facade = OfficeLocationFacade.new(@office_location)

    friendly_id_redirect(@office_location)
  end

  private

  def find_office_location
    OfficeLocation.displayed.find(params[:id])
  end
end
