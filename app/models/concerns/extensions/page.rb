module Extensions
  module Page
    extend ActiveSupport::Concern

    included do
      default_scope { order(:title) }

      include PgSearchScope
      multisearchable against: %i[title summary content],
                      if: :searchable?

      LAYOUTS = %w(application wealth_management notary).freeze
      STYLES = %w(service_large chatbot).freeze
    end

    class_methods do
    end
  end
end
