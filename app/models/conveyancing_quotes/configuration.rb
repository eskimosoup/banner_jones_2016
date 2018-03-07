module ConveyancingQuotes
  class Configuration < ApplicationRecord
    include OptimadminScopes

    # Outside Location doesn't have correct fees set up
    # LOCATIONS = ['London', 'Outside London'].freeze
    LOCATIONS = ['London'].freeze
    STYLES = ['full_details'].freeze

    validates :title, presence: true
    validates :location, inclusion: { in: LOCATIONS }
    validates :style, inclusion: { in: STYLES }

    has_many :quote_locations,
             class_name: 'QuoteLocation',
             foreign_key: :conveyancing_quotes_configuration_id
  end
end
