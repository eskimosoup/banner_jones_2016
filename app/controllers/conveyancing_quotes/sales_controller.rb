module ConveyancingQuotes
  class SalesController < BaseController
    before_action :valid_user

    def update
      @conveyancing_quote_sale = current_user.sale
      @update = @conveyancing_quote_sale.update(conveyancing_quotes_sale_params)

      respond_to do |format|
        format.js
      end
    end

    private

    def conveyancing_quotes_sale_params
      params.require(:conveyancing_quotes_sale).permit(
        :timeframe, :price, :leasehold_house, :leasehold_apartment,
        :shared_ownership_scheme
      )
    end
  end
end
