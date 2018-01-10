class Payment < ApplicationRecord
  validates :amount, presence: true, numericality: { less_than: 1000 }
  validates :contact_number, presence: true
  validates :invoice_number, presence: true
  validates :name, presence: true

  before_create :generate_code

  def generate_code
    begin
      self[:code] = SecureRandom.urlsafe_base64
    end while Payment.exists?(code: self[:code])
  end

  def credit_card_amount
    amount
    # BigDecimal.new('1.022') * amount
  end
end
