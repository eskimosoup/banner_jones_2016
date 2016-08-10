module Extensions
  module Service
    extend ActiveSupport::Concern

    included do
      RELATIONSHIPS = %w(related_services articles case_studies resources events videos frequently_asked_questions offices team_members testimonials).freeze
      LAYOUTS = %w(application wealth_management).freeze
      STYLES  = %w(basic purchase_plus).freeze
    end

    class_methods do
    end
  end
end
