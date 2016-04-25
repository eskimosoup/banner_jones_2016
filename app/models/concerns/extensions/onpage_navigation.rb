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
         %w(Accreditations accreditations)
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
