# frozen_string_literal: true

module ConveyancingQuotes
  class SaleAndPurchasesController < BaseController
    before_action :valid_user

    def new
      @conveyancing_quote_sale_and_purchase = @user.build_sale_and_purchase
      @conveyancing_quote_sale_and_purchase.build_sale
      @conveyancing_quote_sale_and_purchase.build_purchase
    end

    def create
      @conveyancing_quote_sale_and_purchase = @user.build_sale_and_purchase(conveyancing_quotes_sale_and_purchase_params)
      if @conveyancing_quote_sale_and_purchase.save
        redirect_to conveyancing_quotes_location_users_path(@user.quote_location)
      else
        redirect_to new_conveyancing_quotes_location_users_path(@user.quote_location)
      end
    end

    private

    def conveyancing_quotes_sale_and_purchase_params
      params.require(:conveyancing_quotes_sale_and_purchase).permit(
        purchase_attributes: %i[timeframe price second_home_or_buy_to_let leasehold_house
                                leasehold_apartment help_to_buy_scheme help_to_buy_isa
                                shared_ownership_scheme],
        sale_attributes: %i[timeframe price leasehold_house leasehold_apartment shared_ownership_scheme]

      )
    end
  end
end
