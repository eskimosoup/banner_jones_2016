module Extensions
  module OnpageNavigation
    extend ActiveSupport::Concern

    included do
      PARTIALS = [
        ['Service',
         ['Additional content', 'content'],
         %w(Resources resources),
         ['Frequently asked questions', 'faqs'],
         %w(Testimonials testimonials),
         ['Latest articles', 'articles'],
         ['Latest tweets', 'twitter'],
         %w(Videos videos),
         ['Service pages', 'service_pages'],
         ['Team members', 'team_members'],
         %w(Accreditations accreditations),
         ['Conveyancing - London header', 'conveyancing/london_header'],
         ['Conveyancing - Team Member and Reviews', 'conveyancing/team_member_and_reviews'],
         ['Conveyancing - CTA points', 'conveyancing/cta_points'],
         ['Conveyancing - Testimonials', 'conveyancing/testimonials'],
         ['Conveyancing - Process', 'conveyancing/process'],
         ['Conveyancing - Team Member', 'conveyancing/team_member']
       ],
        # ['Team Members',
        # ['Frequently Asked Questions', 'faqs'],
        # ['Services list', 'services']
        # ]
      ].freeze

      LAYOUTS = [
        ['100%', '12'],
        ['91%', '11'],
        ['83%', '10'],
        ['70%', '9'],
        ['66%', '8'],
        ['58%', '7'],
        ['50%', '6'],
        ['41%', '5'],
        ['33%', '4'],
        ['30%', '3'],
        ['16%', '2'],
        ['8%', '1']
      ].freeze
    end

    class_methods do
    end
  end
end
