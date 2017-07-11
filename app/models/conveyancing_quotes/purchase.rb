module ConveyancingQuotes
  class Purchase < ApplicationRecord
    validates :price, numericality: { greater_than: 0 }

    belongs_to :user, foreign_key: 'conveyancing_quotes_user_id'

    belongs_to :sale_and_purchase,
               optional: true,
               foreign_key: 'conveyancing_quotes_sales_and_purchase_id'

    delegate :fee, :vat, :total, to: :conveyancing_calculator
    # delegate :stamp_duty, to: :stamp_duty_calculator

    def conveyancing_calculator
      @conveyancing_calculator ||= ConveyancingCalculator::Purchase.new(price, user.symbolised_location)
    end

    def land_fee_calculator
      @land_fee_calculator ||= ConveyancingCalculator::LandFees.new(price)
    end

    def stamp_duty_calculator
      @stamp_duty_calculator ||= StampDuty.for(price)
    end

    def stamp_duty
      stamp_duty_calculator.calculate if stamp_duty_calculator.stamp_duty == 0
      stamp_duty_calculator.stamp_duty
    end

    def additional_costs
      additional_costs = []
      %i[shared_ownership_scheme
         help_to_buy_isa
         help_to_buy_scheme
         leasehold_house
         leasehold_apartment].each do |x|
           additional_costs << x.to_sym if send(x)
         end
       additional_costs
    end

    def leasehold?
      leasehold_house? || leasehold_apartment?
    end
  end
end
