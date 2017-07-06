module Optimadmin
  module ConveyancingQuotes
    class UserPresenter
      include Optimadmin::PresenterMethods

      presents :user
      delegate :id, :forename, :surname, to: :user

      def toggle_title
        h.link_to full_name, h.conveyancing_quotes_quote_location_user_path(user.quote_location, user)
      end

      def created_date
        h.l user.created_at, format: :short
      end

      def view_link
        h.link_to eye, h.conveyancing_quotes_quote_location_user_path(user.quote_location, user), class: 'menu-item-control'
      end

      def submitted
        user.submitted? ? 'Yes' : 'No'
      end

      private

      def full_name
        "#{forename} #{surname}"
      end
    end
  end
end
