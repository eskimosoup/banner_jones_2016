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
        when 'audiences'
          ::Audience.order(:title)
        when 'event_categories'
          ::EventCategory.order(:title)
        when 'events'
          ::Event.order(:title)
        when 'office_locations'
          ::OfficeLocation.order(:name)
        when 'offices'
          ::Office.order(:building_name)
        when 'pages'
          ::Page.order(:title)
        when 'resources'
          ::Resource.order(:title)
        # when 'resource_categories'
        #  ::ResourceCategory.order(:title)
        when 'services'
          ::Service.order(:title)
        when 'team_members'
          ::TeamMember.order(:surname)
        when 'conveyancing_quotes/quote_locations'
          ::ConveyancingQuotes::QuoteLocation.order(:title)

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
          ::Article.displayed
        when 'audiences'
          ::Audience.displayed
        when 'event_categories'
          ::EventCategory.displayed
        when 'events'
          ::Event.displayed
        when 'office_locations'
          ::OfficeLocation.displayed
        when 'offices'
          ::Office.displayed
        when 'pages'
          ::Page.displayed
        #when 'resource'
          #::Resource.displayed
        # when 'resource_categories'
        #  ::ResourceCategory.displayed
        when 'services'
          ::Service.displayed
        when 'team_members'
          ::TeamMember.displayed
        when 'conveyancing_quotes/quote_locations'
          ::ConveyancingQuotes::QuoteLocation.displayed.order(:title)

        else
          []
        end
      end
    end
  end
end
