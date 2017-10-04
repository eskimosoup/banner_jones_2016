module ConveyancingQuotes
  class SalesController < BaseController
    before_action :valid_user

    def new
      @conveyancing_quote_sale = @user.build_sale
    end

    def create
      @conveyancing_quote_sale = @user.build_sale(conveyancing_quotes_sale_params)
      if @conveyancing_quote_sale.save
        redirect_to conveyancing_quotes_location_users_path(@user.quote_location),
                    notice: 'Conveyancing Quote saved'
      else
        render :new
      end
    end

    def update
      @conveyancing_quote_sale = current_user.sale
      @update = @conveyancing_quote_sale.update(conveyancing_quotes_sale_params)

      respond_to do |format|
        format.js
      end
    end

    def show
      @conveyancing_quote_sale = @user.sale
    end

    private

    def conveyancing_quotes_sale_params
      params.require(:conveyancing_quotes_sale).permit(
        :timeframe, :price, :leasehold_house, :leasehold_apartment, :shared_ownership_scheme
      )
    end
  end
end
