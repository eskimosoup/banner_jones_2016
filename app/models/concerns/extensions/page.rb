module Extensions
  module Page
    extend ActiveSupport::Concern

    included do
      default_scope { order(:title) }

      include PgSearchScope
      multisearchable against: %i[title summary content],
                      if: :searchable?

      LAYOUTS = %w(application wealth_management wealth_management_2018 notary notary_2018 landing_page_design).freeze
      STYLES = %w(basic chatbot service_large).freeze
    end

    class_methods do
    end
  end
end
