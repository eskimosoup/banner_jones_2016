class OfficesController < ApplicationController
  layout 'landing_page_design'

  def index
    @offices = displayed_offices
  end

  def show
    @office = find_office
    @offices = displayed_offices
    friendly_id_redirect(@office)
  end

  private

  def displayed_offices
    Office.displayed
  end

  def find_office
    Office.displayed.find(params[:id])
  end
end
