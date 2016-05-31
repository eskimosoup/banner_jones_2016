class Payment < ApplicationRecord
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :code, presence: true
  validates :contact_number, presence: true
  validates :invoice_number, presence: true
  validates :name, presence: true

  before_create :generate_code

  def generate_code
    begin
      self[:code] = SecureRandom.urlsafe_base64
    end while Payment.exists?(code: self[:code])
  end
end
