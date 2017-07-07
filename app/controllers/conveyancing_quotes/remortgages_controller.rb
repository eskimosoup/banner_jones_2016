=begin
module ConveyancingQuotes
  class RemortgagesController < ::ApplicationController
    def new
      @conveyancing_quote_remortgage = ConveyancingQuotes::Remortgage.new
    end

    def create
      @conveyancing_quote_remortgage = ConveyancingQuotes::Remortgage.new(conveyancing_quotes_remortgage_params)

      if @conveyancing_quote_remortgage.save
        redirect_to @conveyancing_quote_remortgage, notice: "Conveyancing quote saved"
      else
        render :new
      end
    end

    def show
      @conveyancing_quote_remortgage = ConveyancingQuotes::Remortgage.find(params[:id])
    end

    private

    def conveyancing_quotes_remortgage_params
      params.require(:conveyancing_quotes_remortgage).permit(:title, :forename,
                                                       :surname, :phone, :email,
                                                       :timeframe, :price)
    end
  end
end
=end
