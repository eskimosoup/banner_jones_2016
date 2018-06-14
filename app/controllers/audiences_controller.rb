class AudiencesController < ApplicationController
  def show
    @facade = AudienceFacade.new(params[:id])
    @services ||= Service.root_services.displayed.order(:title).pluck(:title, :id)
    @offices ||= Office.displayed
    render template: 'homes/show'
  end
end
