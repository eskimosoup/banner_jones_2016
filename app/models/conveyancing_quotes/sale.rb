class ConveyancingQuotes::Sale < ApplicationRecord
  validates :forename, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :surname, presence: true
  validates :title, presence: true

  delegate :fee, to: :conveyancing_calculator

  def conveyancing_calculator
    @conveyancing_calculator ||= ConveyancingCalculator::Sale.new(price)
  end
end
