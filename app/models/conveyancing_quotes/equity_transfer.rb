class ConveyancingQuotes::EquityTransfer < ApplicationRecord
  validates :email, presence: true
  validates :forename, presence: true
  validates :phone, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :surname, presence: true
  validates :title, presence: true

  def fee
    BigDecimal("395.00")
  end

  def vat
    fee * ConveyancingCalculator.configuration.vat_rate
  end

  def total
    fee + vat
  end
end
