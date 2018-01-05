# frozen_string_literal: true

module Optimadmin
  class OfficeLocationsController < Optimadmin::ApplicationController
    before_action :feature_check

    before_action :set_office_location, only: %i[show edit update destroy]

    edit_images_for ::OfficeLocation,
                      [
                        [:image, {
                          show: ['fill', 1920, 300]
                        }]
                      ]


    def index
      @pagination_helper = OfficeLocation.field_order(params[:order])
                                         .field_search(params[:search], 'name')
                                         .pagination(params[:page], params[:per_page])

      @office_locations = Optimadmin::BaseCollectionPresenter.new(
        collection: @pagination_helper,
        view_template: view_context,
        presenter: Optimadmin::OfficeLocationPresenter
      )
    end

    def show; end

    def new
      @office_location = OfficeLocation.new
    end

    def edit; end

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
      @office_location = OfficeLocation.friendly.find(params[:id])
    end

    def office_location_params
      params.require(:office_location).permit(
        :name, :display, :title, :content, :suggested_url, :image,
        :image_cache, :remove_image, :remote_image_url
      )
    end

    def feature_check
      return redirect_to root_url unless Flipflop.offices?
    end
  end
end
