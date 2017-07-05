module ConveyancingQuotes
  class UsersController < BaseController
    before_action :set_location

    def new
      @user = @location.users.new
    end

    def create
      @user = @location.users.new(user_params)
      if @user.save
        session[:conveyancing_quote] = @user.token
        redirect_to user_redirect_path
      else
        render :new
      end
    end

    private

    def user_params
      params.require(:conveyancing_quotes_user).permit(
        :forename, :surname, :email, :phone, :buying, :selling,
        :conveyancing_email_permission
      )
    end

    def user_redirect_path
      if @user.buying?
        new_conveyancing_quotes_purchase_path
      elsif @user.selling?
        new_conveyancing_quotes_sale_path
      end
    end
  end
end
