module ConveyancingQuotes
  class UsersController < BaseController
    before_action :set_location
    before_action :valid_user, only: %i[edit update show]
    before_action :current_user, only: %i[thank_you]

    def new
      session.delete(:conveyancing_quote)
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

    def edit; end

    def update
      if @user.update(user_params)
        @user.update_attributes(submitted: true)
        ConveyancingQuoteMailer.new_quote(@user).deliver_now
        redirect_to thank_you_conveyancing_quotes_location_users_path(@user.quote_location)
      else
        render :edit
      end
    end

    def show; end

    def thank_you
      redirect_to root_url if @user.blank?
    end

    private

    def user_params
      params.require(:conveyancing_quotes_user).permit(
        :forename, :surname, :email, :phone, :buying, :selling,
        :conveyancing_email_permission
      )
    end

    def user_redirect_path
      if @user.buying? && @user.selling?
        new_conveyancing_quotes_sale_and_purchase_path
      elsif @user.buying?
        new_conveyancing_quotes_purchase_path
      elsif @user.selling?
        new_conveyancing_quotes_sale_path
      end
    end
  end
end
