module ConveyancingQuotes
  class QuoteLocationsController < BaseController
    def show
      @quote_location = QuoteLocation.displayed.find(params[:id])
      redirect_to new_conveyancing_quotes_location_users_path(@quote_location)
    end
  end
end
