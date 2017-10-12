=begin
module ConveyancingQuotes
  class PropertyAddressesController < BaseController
    before_action :valid_user

    def new
      redirect_to edit_conveyancing_quotes_property_addresses_path if @user.addresses.property.present?
      @address = @user.addresses.new(address_type: 'Property')
    end

    def create
      @address = @user.addresses.new(address_params.merge(address_type: 'Property'))
      if @address.save
        redirect_to new_conveyancing_quotes_correspondence_addresses_path
      else
        render :new
      end
    end

    def create
      @address = @user.addresses.new(address_params.merge(address_type: 'Property'))
      if @address.save
        redirect_to new_conveyancing_quotes_correspondence_addresses_path
      else
        render :new
      end
    end

    def edit
      @address = @user.addresses.property
    end

    def update
      @address = @user.addresses.property
      if @address.update(address_params)
        redirect_to new_conveyancing_quotes_correspondence_addresses_path
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
=end
