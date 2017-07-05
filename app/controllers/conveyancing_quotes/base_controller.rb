module ConveyancingQuotes
  class BaseController < ::ApplicationController
    private

    def valid_user
      @user ||= User.find_by(token: session[:conveyancing_quote])
      return redirect_to root_url, notice: 'Error' if session[:conveyancing_quote].blank? || @user.blank?
    end

    def set_location
      @location = QuoteLocation.friendly.displayed.find(params[:location_id])
    end
  end
end
