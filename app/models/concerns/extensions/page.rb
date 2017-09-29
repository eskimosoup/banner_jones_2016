module Extensions
  module Page
    extend ActiveSupport::Concern

    included do
      LAYOUTS = %w(application wealth_management notary).freeze
      STYLES = %w(basic chatbot).freeze
    end

    class_methods do
    end
  end
end
