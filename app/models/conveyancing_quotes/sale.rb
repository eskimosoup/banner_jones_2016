class ConveyancingQuotes::Sale < ApplicationRecord
  validates :price, numericality: { greater_than: 0 }

  belongs_to :user, foreign_key: 'conveyancing_quotes_user_id'

  delegate :fee, to: :conveyancing_calculator

  def conveyancing_calculator
    @conveyancing_calculator ||= ConveyancingCalculator::Sale.new(price, user.symbolised_location)
  end

  def additional_costs
    additional_costs = []
    %i[shared_ownership_scheme
       leasehold_house
       leasehold_apartment].each do |x|
         additional_costs << x.to_sym if send(x)
       end
    additional_costs
  end
end
