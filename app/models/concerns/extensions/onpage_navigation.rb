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
         ['Team members', 'team_members']
       ],
        ['Team Members',
         ['Frequently Asked Questions 2', 'faqs'],
         ['Services list 2', 'services']
        ]
      ].freeze
    end

    class_methods do
    end
  end
end
