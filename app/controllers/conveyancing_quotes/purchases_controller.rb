module ConveyancingQuotes
  class PurchasesController < BaseController
    before_action :valid_user

    def new
      @conveyancing_quote_purchase = @user.build_purchase
    end

    def create
      @conveyancing_quote_purchase = @user.build_purchase(conveyancing_quotes_purchase_params)
      if @conveyancing_quote_purchase.save
        redirect_to @conveyancing_quote_purchase, notice: 'Conveyancing Quote saved'
      else
        render :new
      end
    end

    def show
      @conveyancing_quote_purchase = @user.purchase
    end

    private

    def conveyancing_quotes_purchase_params
      params.require(:conveyancing_quotes_purchase).permit(
        :timeframe, :price, :second_home_or_buy_to_let, :leasehold_house,
        :leasehold_apartment, :help_to_buy_scheme, :help_to_buy_isa,
        :shared_ownership_scheme
      )
    end
  end
end
