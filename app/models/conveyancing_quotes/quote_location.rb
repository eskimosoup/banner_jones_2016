module ConveyancingQuotes
  class QuoteLocation < ApplicationRecord
    include OptimadminScopes
    include Presentable

    extend FriendlyId
    friendly_id :slug_candidates, use: %i[slugged history]

    # Outside Location doesn't have correct fees set up
    # LOCATIONS = ['London', 'Outside London'].freeze
    LOCATIONS = ['London'].freeze

    validates :location, inclusion: { in: LOCATIONS }, uniqueness: true

    scope :displayed, (-> { where(display: true) })

    has_many :users,
             dependent: :destroy,
             foreign_key: 'conveyancing_quotes_quote_location_id'

    before_validation :set_reference_code, unless: :reference_code?

    validates :reference_code, uniqueness: true, presence: true

    def set_reference_code
      self.reference_code = symbolised_location.to_s
    end

    def symbolised_location
      location.downcase.to_param.to_sym
    end

    def slug_candidates
      [
        :suggested_url,
        :location,
        %i[suggested_url location]
      ]
    end

    def should_generate_new_friendly_id?
      if slug.blank? || suggested_url_changed? || location_changed?
        true
      else
        false
      end
    end
  end
end
