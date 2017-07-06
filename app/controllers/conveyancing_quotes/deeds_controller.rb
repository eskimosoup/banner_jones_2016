module ConveyancingQuotes
  class DeedsController < BaseController
    before_action :valid_user

    def new
      @deeds = @user.deeds.build
    end

    def edit
    end

    def update
      if @user.update(user_params)
        redirect_to new_conveyancing_quotes_property_addresses_path
      else
        render :new
      end
    end

    private

    def user_params
      params.require(:conveyancing_quotes_user).permit(
        deeds_attributes: %i[full_name date_of_birth id _destroy]
      )
    end
  end
end
