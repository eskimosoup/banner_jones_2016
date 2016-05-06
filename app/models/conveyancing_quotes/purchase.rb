class ConveyancingQuotes::Purchase < ApplicationRecord
  validates :forename, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :surname, presence: true
  validates :title, presence: true

  delegate :fee, to: :conveyancing_calculator
  delegate :stamp_duty, to: :stamp_duty_calculator

  def conveyancing_calculator
    @conveyancing_calculator ||= ConveyancingCalculator::Purchase.new(price)
  end

  def stamp_duty_calculator
    @stamp_duty_calculator ||= StampDuty.for(price)
  end
end
