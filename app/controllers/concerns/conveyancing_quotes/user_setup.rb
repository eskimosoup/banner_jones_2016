module ConveyancingQuotes
  module UserSetup
    extend ActiveSupport::Concern

    included do
      def set_up_conveyancing_quote(location)
        session.delete(:conveyancing_quote)
        @user = location.users.new(ip_address: request.remote_ip)
        session[:conveyancing_quote] = @user.token
        @location = location
      end
    end
  end
end
