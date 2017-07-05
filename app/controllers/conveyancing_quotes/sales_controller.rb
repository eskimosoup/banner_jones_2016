=begin
module ConveyancingQuotes
  class SalesController < ::ApplicationController
    def new
      @conveyancing_quote_sale = ConveyancingQuotes::Sale.new
    end

    def create
      @conveyancing_quote_sale = ConveyancingQuotes::Sale.new(conveyancing_quotes_sale_params)
      if @conveyancing_quote_sale.save
        redirect_to @conveyancing_quote_sale, notice: "Conveyancing Quote saved"
      else
        render :new
      end
    end

    def show
      @conveyancing_quote_sale = ConveyancingQuotes::Sale.find(params[:id])
    end

    private

    def conveyancing_quotes_sale_params
      params.require(:conveyancing_quotes_sale).permit(:title, :forename,
                                                       :surname, :phone, :email,
                                                       :timeframe, :price)
    end
  end
end
=end
