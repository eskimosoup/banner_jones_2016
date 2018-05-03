module Extensions
  module Service
    extend ActiveSupport::Concern

    included do
      include PgSearchScope
      multisearchable against: %i[title summary content],
                      if: :searchable?

      RELATIONSHIPS = %w(related_services articles case_studies resources events videos frequently_asked_questions offices team_members testimonials).freeze
      LAYOUTS = %w(application wealth_management notary landing_page_design).freeze
      STYLES  = %w(basic purchase_plus conveyancing stamp_duty_calculator service_large).freeze

      def self.colours
        OptimisedSite.configuration.service_colours
      end
    end

    class_methods do

    end
  end
end
