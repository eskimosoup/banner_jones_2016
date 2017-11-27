# frozen_string_literal: true

module Optimadmin
  module Resources
    class SectionPresenter
      include Optimadmin::PresenterMethods

      presents :section
      delegate :id, :title, to: :section

      def toggle_title
        inline_detail_toggle_link(title)
      end

      def optimadmin_summary
        # h.simple_format resources_section.summary
      end
    end
  end
end
