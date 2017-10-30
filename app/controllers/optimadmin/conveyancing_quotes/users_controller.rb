module Optimadmin
  module ConveyancingQuotes
    class UsersController < Optimadmin::ApplicationController
      before_action :set_location
      before_action :set_user, only: %i[show edit update destroy]

      def index
        ::ConveyancingQuotes::User.where('created_at < ? AND started IS NULL', Date.yesterday).destroy_all
        @users = @location.users.where(submitted: true).field_order(params[:order])
                          .field_search(params[:search], 'location')
        @emailed_users = @location.users.where(quote_emailed: true, started: true).field_order(params[:order])
                                     .field_search(params[:search], 'location')
        @incomplete_users = @location.users.where(submitted: nil, quote_emailed: nil, started: true).field_order(params[:order])
                                     .field_search(params[:search], 'location')
      end

      def show; end

      private

      def set_user
        @user = @location.users.find(params[:id])
      end

      def set_location
        @location = ::ConveyancingQuotes::QuoteLocation.friendly.find(params[:quote_location_id])
      end
    end
  end
end
