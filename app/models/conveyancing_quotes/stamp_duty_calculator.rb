module ConveyancingQuotes
  class StampDutyCalculator
    include ActiveModel::Model
    include ActiveModel::Validations

    attr_accessor :price, :purchase_type

    validates :price, presence: true

    def stamp_duty_calculator
      @stamp_duty_calculator ||= StampDuty.for(price.gsub(/\D/, '').to_f, second_home_or_buy_to_let, first_time_buyer)
    end

    def first_time_buyer
      purchase_type == 'first_time_buyer' ? true : false
    end

    def second_home_or_buy_to_let
      purchase_type == 'second_home_or_buy_to_let' ? true : false
    end

    def stamp_duty
      stamp_duty_calculator.calculate if stamp_duty_calculator.stamp_duty.zero?
      stamp_duty_calculator.stamp_duty
    end
  end
end
