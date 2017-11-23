module ConveyancingQuotes
  class StampDutyCalculatorsController < ::ApplicationController
    def create
      @stamp_duty_calculator = StampDutyCalculator.new(stamp_duty_calculator_params)

      respond_to do |format|
        format.js do
          if @stamp_duty_calculator.valid?
            @stamp_duty = @stamp_duty_calculator.stamp_duty
            render :create
          else
            render :new
          end
        end
      end
    end

    private

    def stamp_duty_calculator_params
      params.require(:conveyancing_quotes_stamp_duty_calculator).permit(
        :price, :purchase_type
      )
    end
  end
end
