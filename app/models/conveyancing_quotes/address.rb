module ConveyancingQuotes
  class Address < ApplicationRecord
    belongs_to :user, foreign_key: 'conveyancing_quotes_user_id'

    validates :address_type,
              inclusion: { in: %w[Correspondence Property] },
              uniqueness: { scope: :conveyancing_quotes_user_id }
    validates :house_number,
              presence: true
    validates :town,
              presence: true
    validates :postcode,
              presence: true

    def self.correspondence
      find_by(address_type: 'Correspondence')
    end

    def self.property
      find_by(address_type: 'Property')
    end

    def address_fields
      [house_number, address_line_1, address_line_2, town, postcode].reject(&:blank?).join(', ')
    end
  end
end
