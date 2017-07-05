module ConveyancingQuotes
  class QuoteLocationsController < BaseController
    def show
      @quote_location = QuoteLocation.displayed.find(params[:id])
    end
  end
end
