module Optimadmin
  module ConveyancingQuotes
    class QuoteLocationPresenter
      include Optimadmin::PresenterMethods

      presents :quote_location
      delegate :id, :location, to: :quote_location

      def toggle_title
        inline_detail_toggle_link(location)
      end

      def optimadmin_summary
        # h.simple_format conveyancing_quotes_location.summary
      end

      def show_users
        h.link_to 'View quotes in this location', h.conveyancing_quotes_quote_location_users_path(quote_location)
      end
    end
  end
end
