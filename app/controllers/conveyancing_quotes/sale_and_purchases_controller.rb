module ConveyancingQuotes
  class SaleAndPurchasesController < ::ApplicationController
    def new
      @conveyancing_quote_sale_and_purchase = ConveyancingQuotes::SaleAndPurchase.new
    end

    def create
      @conveyancing_quote_sale_and_purchase = ConveyancingQuotes::SaleAndPurchase.new(conveyancing_quotes_sale_and_purchase_params)
      if @conveyancing_quote_sale_and_purchase.save
        redirect_to @conveyancing_quote_sale_and_purchase, notice: "Conveyancing Quote saved"
      else
        render :new
      end
    end

    def show
      @conveyancing_quote_sale_and_purchase = ConveyancingQuotes::SaleAndPurchase.find(params[:id])
    end

    private

    def conveyancing_quotes_sale_and_purchase_params
      params.require(:conveyancing_quotes_sale_and_purchase).permit(:title, :forename,
                                                       :surname, :phone, :email,
                                                       :timeframe, :sale_price, :purchase_price)
    end

  end
end
