module Optimadmin
  class ServicePagesController < Optimadmin::ApplicationController
    before_action :set_service_page, only: [:show, :edit, :update, :destroy]
    before_action :set_service
    before_action :display_status, only: :index

    include Optimadmin::Services::PageCrops

    def index
      @pagination_helper = @all_items
                           .pagination(params[:page], params[:per_page])

      @service_pages = Optimadmin::BaseCollectionPresenter.new(
        collection: @pagination_helper,
        view_template: view_context,
        presenter: Optimadmin::ServicePagePresenter
      )
    end

    def show
    end

    def new
      @service_page = ::Services::Page.new(service_id: @service.id)
    end

    def edit
    end

    def create
      @service_page = ::Services::Page.new(service_page_params)
      if @service_page.save
        redirect_to_index_or_continue_editing(@service_page, service_id: @service_page.service.id)
      else
        @service = @service_page.service
        render :new
      end
    end

    def update
      if @service_page.update(service_page_params)
        redirect_to_index_or_continue_editing(@service_page, service_id: @service_page.service.id)
      else
        render :edit
      end
    end

    def destroy
      @service_page.destroy
      redirect_to services_pages_url(service_id: @service.id), notice: 'Service page was successfully destroyed.'
    end

    private

    def set_service
      if params[:service_id].present?
        @service = Service.find(params[:service_id])
      elsif @service_page.present? && @service_page.service.present?
        @service = @service_page.service
      end
    end

    def display_status
      @all_items = ::Services::Page.where(service_id: @service.id)
                                   .field_order(params[:order])
                                   .field_search(params[:search])
      @scheduled_items = @all_items.scheduled
      @published_items = @all_items.published
      @expired_items   = @all_items.expired
    end

    def set_service_page
      @service_page = ::Services::Page.friendly.find(params[:id])
    end

    def service_page_params
      params.require(:services_page)
            .permit(:title, :suggested_url, :publish_at, :expire_at,
                    :social_share_title, :social_share_description,
                    :social_share_image, :remove_social_share_image,
                    :remote_social_share_image_url, :social_share_image_cache,
                    :content, :image, :remove_image, :image_cache, :summary,
                    :remote_image_url, :service_id, :layout, :style,
                    :parent_id, :show_contact_form)
    end
  end
end
