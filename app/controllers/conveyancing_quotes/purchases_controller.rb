# frozen_string_literal: true

module ConveyancingQuotes
  class PurchasesController < BaseController
    before_action :valid_user

    def update
      @conveyancing_quote_sale = current_user.purchase
      @update = @conveyancing_quote_sale.update(conveyancing_quotes_purchase_params)

      respond_to do |format|
        format.js
      end
    end

    private

    def conveyancing_quotes_purchase_params
      params.require(:conveyancing_quotes_purchase).permit(
        :timeframe, :price, :second_home_or_buy_to_let, :leasehold_house,
        :leasehold_apartment, :help_to_buy_scheme, :help_to_buy_isa,
        :shared_ownership_scheme, :first_time_buyer
      )
    end
  end
end
