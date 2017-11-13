module ConveyancingQuotes
  module UserSetup
    extend ActiveSupport::Concern

    included do
      def set_up_conveyancing_quote(location)
        session.delete(:conveyancing_quote)
        @user = location.users.new(ip_address: request.remote_ip)
        @user.save!
        session[:conveyancing_quote] = @user.token
        @conveyancing_quote_sale_and_purchase = @user.build_sale_and_purchase
        @conveyancing_quote_sale_and_purchase.build_sale
        @conveyancing_quote_sale_and_purchase.build_purchase
      end
    end
  end
end
