module Optimadmin
  module ConveyancingQuotes
    class QuoteLocationsController < Optimadmin::ApplicationController
      before_action :set_conveyancing_quotes_location, only: %i[show edit update destroy]

      def index
        @conveyancing_quotes_locations = ::ConveyancingQuotes::QuoteLocation.field_order(params[:order])
                                                                            .field_search(params[:search], 'location')
                                                                            .pagination(params[:page], params[:per_page])
            end

      def show; end

      def new
        @conveyancing_quotes_location = ::ConveyancingQuotes::QuoteLocation.new
      end

      def edit; end

      def create
        @conveyancing_quotes_location = ::ConveyancingQuotes::QuoteLocation.new(conveyancing_quotes_location_params)
        if @conveyancing_quotes_location.save
          redirect_to_index_or_continue_editing(@conveyancing_quotes_location)
        else
          render :new
        end
      end

      def update
        if @conveyancing_quotes_location.update(conveyancing_quotes_location_params)
          redirect_to_index_or_continue_editing(@conveyancing_quotes_location)
        else
          render :edit
        end
      end

      def destroy
        @conveyancing_quotes_location.destroy
        redirect_to conveyancing_quotes_locations_url, notice: 'Conveyancing quotes location was successfully destroyed.'
      end

      private

      def set_conveyancing_quotes_location
        @conveyancing_quotes_location = ::ConveyancingQuotes::QuoteLocation.friendly.find(params[:id])
      end

      def conveyancing_quotes_location_params
        params.require(:conveyancing_quotes_quote_location).permit(
          :location, :suggested_url, :display, :details
        )
      end
    end
  end
end
