module ConveyancingQuotes
  class BaseController < ::ApplicationController
    before_action :set_service
    layout 'conveyancing_calculator'

    private

    def valid_user
      if current_user.blank?
        return redirect_to root_url
      elsif current_user.submitted?
        return redirect_to thank_you_conveyancing_quotes_location_users_path(current_user.quote_location)
      else
        current_user
      end
    end

    helper_method def current_user
      @user ||= User.find_by(token: session[:conveyancing_quote])
      # return redirect_to root_url, notice: 'Error' if session[:conveyancing_quote].blank? || @user.blank?
    end

    def set_location
      @location = QuoteLocation.friendly.displayed.find(params[:location_id])
    end

    def set_service
      @service = Service.displayed.find(1)
      @audience = @service.audience
    end
  end
end
