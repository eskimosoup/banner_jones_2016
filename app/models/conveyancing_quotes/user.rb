module ConveyancingQuotes
  class User < ApplicationRecord
    include OptimadminScopes

    default_scope { order(created_at: :desc) }

    attr_accessor :buying_and_selling, :complete

    # validates :title, inclusion: { in: ConveyancingQuotes::TITLES }

    validates :forename, presence: true, if: :complete?
    validates :surname, presence: true, if: :complete?
    validates :email, presence: true, if: :complete?
    validates :phone, presence: true, if: :complete?

    #validates :buying,
    #          presence: { message: 'can not be blank, unless selling or buying and selling' },
    #          if: proc{ |x| x.selling.blank? && (x.buying_and_selling == '0') }
    #validates :selling,
    #          presence: { message: 'can not be blank, unless buying or buying and selling' },
    #          if: proc{ |x| x.buying.blank? && (x.buying_and_selling == '0') }
    #validates :buying_and_selling,
    #          presence: { message: 'can not be blank, unless buying or selling are set individually' },
    #          if: proc{ |x| x.buying.blank? && x.selling.blank? }

    belongs_to :quote_location,
               foreign_key: 'conveyancing_quotes_quote_location_id'

    has_one :purchase,
            dependent: :destroy,
            foreign_key: 'conveyancing_quotes_user_id'

    has_one :sale,
            dependent: :destroy,
            foreign_key: 'conveyancing_quotes_user_id'

    has_one :sale_and_purchase,
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
    before_create :buying_and_selling_boolean

    def full_name
      [forename, surname].join(' ')
    end

    def complete?
      complete.present?
    end

    def quote_reference
      "#{quote_location.reference_code}-#{created_at.to_i.to_s[-3..-1]}-#{id}".upcase
    end

    def generate_token(column)
      loop do
        self[column] = SecureRandom.urlsafe_base64
        break unless ConveyancingQuotes::User.exists?(column => self[column])
      end
      self[column]
    end

    def buying_and_selling_boolean
      return if buying_and_selling == '0'
      self.buying = true
      self.selling = true
    end
  end
end
