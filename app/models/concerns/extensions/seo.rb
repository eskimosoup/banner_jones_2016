module Extensions
  module Seo
    extend ActiveSupport::Concern

    included do
      def self.objects_for_seo(controller_name)
        case controller_name
        when '' # These lines are in for syntactical
          []    # reasons and can be deleted

        # In this area write cases for each of the modules with show pages
        # that you would like to appear in the admin seo section. Eg.
        #
        when 'articles'
          ::Article.order(:title)

        else
          []
        end
        end

      def self.objects_for_sitemap(controller_name)
        case controller_name
        when '' # These lines are in for syntactical
          []    # reasons and can be deleted

        # In this area write cases for each of the modules with show pages
        # that you would like to appear in the admin sitemap. Eg.
        #
        when 'articles'
          ::Article.published

        else
          []
        end
      end
    end
  end
end
