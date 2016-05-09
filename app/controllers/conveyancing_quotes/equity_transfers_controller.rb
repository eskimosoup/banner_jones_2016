module ConveyancingQuotes
  class EquityTransfersController < ::ApplicationController
    def new
      @conveyancing_quote_equity_transfer = ConveyancingQuotes::EquityTransfer.new
    end

    def create
      @conveyancing_quote_equity_transfer = ConveyancingQuotes::EquityTransfer.new(conveyancing_quotes_equity_transfer_params)

      if @conveyancing_quote_equity_transfer.save
        redirect_to @conveyancing_quote_equity_transfer, notice: "Conveyancing quote saved"
      else
        render :new
      end
    end

    def show
      @conveyancing_quote_equity_transfer = ConveyancingQuotes::EquityTransfer.find(params[:id])
    end

    private

    def conveyancing_quotes_equity_transfer_params
      params.require(:conveyancing_quotes_equity_transfer).permit(:title, :forename,
                                                       :surname, :phone, :email,
                                                       :timeframe, :price)
    end
  end
end
