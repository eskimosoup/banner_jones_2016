module ConveyancingQuotes
  class CorrespondenceAddressesController < BaseController
    before_action :valid_user

    def new
      redirect_to edit_conveyancing_quotes_correspondence_addresses_path if @user.addresses.correspondence.present?
      @address = @user.addresses.new(address_type: 'Correspondence')
    end

    def create
      @address = @user.addresses.new(address_params.merge(address_type: 'Correspondence'))
      if @address.save
        redirect_to edit_conveyancing_quotes_location_users_path(@user.quote_location)
      else
        render :new
      end
    end

    def edit
      @address = @user.addresses.correspondence
    end

    def update
      @address = @user.addresses.correspondence
      if @address.update(address_params)
        redirect_to edit_conveyancing_quotes_location_users_path(@user.quote_location)
      else
        render :edit
      end
    end

    private

    def address_params
      params.require(:conveyancing_quotes_address).permit(
        :house_number, :address_line_1, :address_line_2, :town, :postcode
      )
    end
  end
end
