class AudiencesController < ApplicationController
  def show
    @facade = AudienceFacade.new(params[:id])
    render template: "homes/show"
  end
end
