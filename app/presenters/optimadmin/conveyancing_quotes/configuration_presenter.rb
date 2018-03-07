module Optimadmin
  module ConveyancingQuotes
    class ConfigurationPresenter
      include Optimadmin::PresenterMethods

      presents :configuration
      delegate :id, :title, to: :configuration

      def toggle_title
        inline_detail_toggle_link(title)
      end

      def optimadmin_summary
        # h.simple_format configuration.summary
      end
    end
  end
end
