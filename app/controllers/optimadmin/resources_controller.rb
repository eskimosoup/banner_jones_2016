module Optimadmin
  class ResourcesController < Optimadmin::ApplicationController
    before_action :feature_check

    before_action :set_resource, only: [:show, :edit, :update, :destroy]
    before_action :display_status, only: :index

    include Optimadmin::ResourceCrops

    def index
      @pagination_helper = @all_items
                           .pagination(params[:page], params[:per_page])

      @resources = Optimadmin::BaseCollectionPresenter.new(
        collection: @pagination_helper,
        view_template: view_context,
        presenter: Optimadmin::ResourcePresenter
      )
    end

    def details
      @resources = Resource.all
    end

    def show
    end

    def new
      @resource = Resource.new
    end

    def edit
    end

    def create
      @resource = Resource.new(resource_params)
      if @resource.save
        redirect_to_index_or_continue_editing(@resource)
      else
        render :new
      end
    end

    def update
      if @resource.update(resource_params)
        redirect_to_index_or_continue_editing(@resource)
      else
        render :edit
      end
    end

    def destroy
      @resource.destroy
      redirect_to resources_url, notice: 'Resource was successfully destroyed.'
    end

    private

    def display_status
      @all_items = Resource.field_order(params[:order])
                           .field_search(params[:search])
      @scheduled_items = @all_items.scheduled
      @published_items = @all_items.published
      @expired_items   = @all_items.expired
    end

    def set_resource
      @resource = Resource.friendly.find(params[:id])
    end

    def resource_params
      params.require(:resource)
            .permit(:title, :suggested_url, :slug, :publish_at, :expire_at,
                    :summary, :content, :file, :image,
                    :remove_file, :remote_file_url, :file_cache,
                    :remove_image, :remote_image_url, :image_cache,
                    :homepage_highlight, :protected,
                    resource_category_ids: [], service_ids: [])
    end

    def feature_check
      return redirect_to root_url unless Flipflop.resources?
    end
  end
end
