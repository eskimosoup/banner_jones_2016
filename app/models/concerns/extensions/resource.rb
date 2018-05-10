module Extensions
  module Resource
    extend ActiveSupport::Concern

    included do
      default_scope { order(:title) }

      include PgSearchScope
      multisearchable against: %i[title summary content],
                      if: :searchable?

      has_many :sections,
               dependent: :destroy,
               class_name: 'Resources::Section'
    end

    class_methods do
    end
  end
end
