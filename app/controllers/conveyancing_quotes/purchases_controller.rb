module ConveyancingQuotes
  class PurchasesController < ::ApplicationController
    def new
      @conveyancing_quote_purchase = ConveyancingQuotes::Purchase.new
    end

    def create
      @conveyancing_quote_purchase = ConveyancingQuotes::Purchase.new(conveyancing_quotes_purchase_params)
      if @conveyancing_quote_purchase.save
        redirect_to @conveyancing_quote_purchase, notice: "Conveyancing Quote saved"
      else
        render :new
      end
    end

    def show
      @conveyancing_quote_purchase = ConveyancingQuotes::Purchase.find(params[:id])
    end
    
    private

    def conveyancing_quotes_purchase_params
      params.require(:conveyancing_quotes_purchase).permit(:title, :forename,
                                                       :surname, :phone, :email,
                                                       :timeframe, :price)
    end
  end
end
