module Optimadmin
  module ConveyancingQuotes
    class ConfigurationsController < Optimadmin::ApplicationController
      before_action :set_conveyancing_quotes_configuration, only: [:show, :edit, :update, :destroy]

      def index
                @conveyancing_quotes_configurations = ::ConveyancingQuotes::Configuration.field_order(params[:order])
                                                .field_search(params[:search])
                                                .pagination(params[:page], params[:per_page])
            end

      def show
      end

      def new
        @conveyancing_quotes_configuration = ::ConveyancingQuotes::Configuration.new
      end

      def edit
      end

      def create
        @conveyancing_quotes_configuration = ::ConveyancingQuotes::Configuration.new(conveyancing_quotes_configuration_params)
        if @conveyancing_quotes_configuration.save
          redirect_to_index_or_continue_editing(@conveyancing_quotes_configuration)
        else
          render :new
        end
      end

      def update
        if @conveyancing_quotes_configuration.update(conveyancing_quotes_configuration_params)
          redirect_to_index_or_continue_editing(@conveyancing_quotes_configuration)
        else
          render :edit
        end
      end

      def destroy
        @conveyancing_quotes_configuration.destroy
        redirect_to conveyancing_quotes_configurations_url, notice: 'Configuration was successfully destroyed.'
      end

      private

      def set_conveyancing_quotes_configuration
        @conveyancing_quotes_configuration = ::ConveyancingQuotes::Configuration.find(params[:id])
      end

      def conveyancing_quotes_configuration_params
        params.require(:conveyancing_quotes_configuration).permit(
          :title, :location, :style, :email_required, :phone_required,
          :show_legal_fee_prices, :show_legal_fee_subtotal,
          :show_additional_services_prices, :show_additional_services_subtotal,
          :show_additional_costs_prices, :show_additional_costs_subtotal, :show_total
        )
      end
    end
  end
end
