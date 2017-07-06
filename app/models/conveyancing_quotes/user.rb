module ConveyancingQuotes
  class User < ApplicationRecord
    # validates :title, inclusion: { in: ConveyancingQuotes::TITLES }
    validates :forename, presence: true
    validates :surname, presence: true
    validates :email, presence: true
    validates :phone, presence: true
    validates :buying,
              presence: { message: 'can not be blank, unless buying' },
              unless: :selling?
    validates :selling,
              presence: { message: 'can not be blank, unless selling' },
              unless: :buying?

    belongs_to :quote_location,
               foreign_key: 'conveyancing_quotes_quote_location_id'

    has_one :purchase,
            dependent: :destroy,
            foreign_key: 'conveyancing_quotes_user_id'

    has_one :sale,
            dependent: :destroy,
            foreign_key: 'conveyancing_quotes_user_id'

    has_many :deeds,
             dependent: :destroy,
             foreign_key: 'conveyancing_quotes_user_id'

    accepts_nested_attributes_for :deeds,
                                  reject_if: :all_blank,
                                  allow_destroy: true

    has_many :addresses,
             dependent: :destroy,
             foreign_key: 'conveyancing_quotes_user_id'

    delegate :symbolised_location, to: :quote_location

    before_create { generate_token(:token) }

    def generate_token(column)
      loop do
        self[column] = SecureRandom.urlsafe_base64
        break unless ConveyancingQuotes::User.exists?(column => self[column])
      end
      self[column]
    end
  end
end
