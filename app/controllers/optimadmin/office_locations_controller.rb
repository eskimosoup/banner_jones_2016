module Optimadmin
  class OfficeLocationsController < Optimadmin::ApplicationController
    before_action :set_office_location, only: [:show, :edit, :update, :destroy]

    def index
      @office_locations = Optimadmin::BaseCollectionPresenter.new(collection: OfficeLocation.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::OfficeLocationPresenter)
    end

    def show
    end

    def new
      @office_location = OfficeLocation.new
    end

    def edit
    end

    def create
      @office_location = OfficeLocation.new(office_location_params)
      if @office_location.save
        redirect_to_index_or_continue_editing(@office_location)
      else
        render :new
      end
    end

    def update
      if @office_location.update(office_location_params)
        redirect_to_index_or_continue_editing(@office_location)
      else
        render :edit
      end
    end

    def destroy
      @office_location.destroy
      redirect_to office_locations_url, notice: 'Office location was successfully destroyed.'
    end

    private

    def set_office_location
      @office_location = OfficeLocation.find(params[:id])
    end

    def office_location_params
      params.require(:office_location).permit(:title, :display)
    end
  end
end
