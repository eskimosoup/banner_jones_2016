module Extensions
  module Page
    extend ActiveSupport::Concern

    included do
      LAYOUTS = %w(application wealth_management).freeze
      STYLES = %w(basic).freeze
    end

    class_methods do
    end
  end
end
