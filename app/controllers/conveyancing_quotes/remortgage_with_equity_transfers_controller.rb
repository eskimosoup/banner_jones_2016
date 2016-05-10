module ConveyancingQuotes
  class RemortgageWithEquityTransfersController < ::ApplicationController
    def new
      @conveyancing_quote_remortgage_with_equity_transfer = ConveyancingQuotes::RemortgageWithEquityTransfer.new
    end

    def create
      @conveyancing_quote_remortgage_with_equity_transfer = ConveyancingQuotes::RemortgageWithEquityTransfer.new(conveyancing_quotes_remortgage_with_equity_transfer_params)

      if @conveyancing_quote_remortgage_with_equity_transfer.save
        redirect_to @conveyancing_quote_remortgage_with_equity_transfer, notice: "Conveyancing quote saved"
      else
        render :new
      end
    end

    def show
      @conveyancing_quote_remortgage_with_equity_transfer = ConveyancingQuotes::RemortgageWithEquityTransfer.find(params[:id])
    end

    private

    def conveyancing_quotes_remortgage_with_equity_transfer_params
      params.require(:conveyancing_quotes_remortgage_with_equity_transfer).permit(:title, :forename,
                                                       :surname, :phone, :email,
                                                       :timeframe, :remortgage_price, :equity_transfer_price)
    end
  end
end
