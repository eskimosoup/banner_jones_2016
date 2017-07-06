module ConveyancingQuotes
  class Deed < ApplicationRecord
    belongs_to :user, foreign_key: 'conveyancing_quotes_user_id'

    validates :full_name, presence: true
    validates :date_of_birth, presence: true
  end
end
