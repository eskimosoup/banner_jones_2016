class ConveyancingQuotes::SaleAndPurchase < ApplicationRecord
  validates :email, presence: true
  validates :forename, presence: true
  validates :phone, presence: true
  validates :purchase_price, presence: true, numericality: { greater_than: 0 }
  validates :sale_price, presence: true, numericality: { greater_than: 0 }
  validates :surname, presence: true
  validates :title, presence: true

  delegate :stamp_duty, to: :stamp_duty_calculator

  def sale_fee
    sale_conveyancing_calculator.fee
  end

  def purchase_fee
    purchase_conveyancing_calculator.fee
  end

  def purchase_conveyancing_calculator
    @purchase_conveyancing_calculator ||= ConveyancingCalculator::Purchase.new(purchase_price)
  end

  def sale_conveyancing_calculator
    @sale_conveyancing_calculator ||= ConveyancingCalculator::Sale.new(sale_price)
  end

  def stamp_duty_calculator
    @stamp_duty_calculator ||= StampDuty.for(purchase_price)
  end
end
