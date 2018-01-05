module ConveyancingQuotes
  class CallbackRequest
    include ActiveModel::Model

    attr_accessor :forename,
                  :surname,
                  :email_address,
                  :contact_telephone,
                  :purchase_price,
                  :purchase_freehold_house,
                  :purchase_freehold_apartment,
                  :purchase_leasehold_house,
                  :purchase_leasehold_apartment,
                  :sale_price,
                  :sale_freehold_house,
                  :sale_freehold_apartment,
                  :sale_leasehold_house,
                  :sale_leasehold_apartment

    validates :forename, presence: true
    validates :surname, presence: true
    validates :email_address, presence: true
    validates :contact_telephone, presence: true

    validates :purchase_price, presence: { message: 'can not be blank, unless sale price is present' }, if: proc { |x| x.sale_price.blank? }
    validates :sale_price, presence: { message: 'can not be blank, unless purchase price is present' }, if: proc { |x| x.purchase_price.blank? }
  end
end
