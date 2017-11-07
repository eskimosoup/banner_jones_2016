module Optimadmin
  class OfficesController < Optimadmin::ApplicationController
    before_action :feature_check

    before_action :set_office, only: [:show, :edit, :update, :destroy]
    before_action :display_status, only: :index

    include Optimadmin::OfficeCrops

    def index
      @pagination_helper = @all_items
                           .pagination(params[:page], params[:per_page])

      @offices = Optimadmin::BaseCollectionPresenter.new(
        collection: @pagination_helper,
        view_template: view_context,
        presenter: Optimadmin::OfficePresenter
      )
    end

    def show
    end

    def new
      @office = Office.new
    end

    def edit
    end

    def create
      @office = Office.new(office_params)
      if @office.save
        redirect_to_index_or_continue_editing(@office)
      else
        render :new
      end
    end

    def update
      if @office.update(office_params)
        redirect_to_index_or_continue_editing(@office)
      else
        render :edit
      end
    end

    def destroy
      @office.destroy
      redirect_to offices_url, notice: 'Office was successfully destroyed.'
    end

    private

    def display_status
      @all_items = Office.field_order(params[:order])
                         .field_search(params[:search], 'building_name')
      @scheduled_items = @all_items.scheduled
      @published_items = @all_items.published
      @expired_items   = @all_items.expired
    end

    def set_office
      @office = Office.friendly.find(params[:id])
    end

    def office_params
      params.require(:office).permit(:building_name, :address_line_1, :address_line_2,
                                     :office_location_id, :postcode, :phone_number, :fax_number, :email,
                                     :dx_number, :details, :image, :publish_at, :expire_at,
                                     :remote_image_url, :remove_image, :image_cache, :page_title,
                                     :latitude, :longitude,
                                     :suggested_url, service_ids: [], team_member_ids: [])
    end

    def feature_check
      return redirect_to root_url unless Flipflop.offices?
    end
  end
end
