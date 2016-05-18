class OfficeLocationsController < ApplicationController
  def show
    @office_location = find_office_location
    @offices = @office_location.offices.displayed
    render 'offices/index'
  end

  private

  def find_office_location
    OfficeLocation.displayed.find(params[:id])
  end
end
