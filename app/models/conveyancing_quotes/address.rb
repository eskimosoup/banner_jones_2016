module ConveyancingQuotes
  class Address < ApplicationRecord
    belongs_to :user, foreign_key: 'conveyancing_quotes_user_id'

    scope :correspondence, -> { find_by(address_type: 'Correspondence') }
    scope :property, -> { find_by(address_type: 'Property') }

    validates :address_type,
              inclusion: { in: %w[Correspondence Property] },
              uniqueness: { scope: :conveyancing_quotes_user_id }
    validates :house_number,
              presence: true
    validates :town,
              presence: true
    validates :postcode,
              presence: true
  end
end
