module Optimadmin
  class ServicesController < Optimadmin::ApplicationController
    before_action :set_service, only: [:show, :edit, :update, :destroy]
    before_action :set_department

    edit_images_for Service,
                    [
                      [:image, { show: ['fit', 200, 200], index: ['fill', 200, 200] }],
                      [:social_share_image, { show: ['fit', 1200, 600] }]
                    ]

    def index
      @services = Optimadmin::BaseCollectionPresenter.new(collection: Service.where('title ILIKE ? AND department_id = ?', "%#{params[:search]}%", @department.id).page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::ServicePresenter)
    end

    def show
    end

    def new
      @service = Service.new
    end

    def edit
    end

    def create
      @service = Service.new(service_params)
      if @service.save
        redirect_to_index_or_continue_editing(@service, department_id: @service.department.id)
      else
        render :new
      end
    end

    def update
      if @service.update(service_params)
        redirect_to_index_or_continue_editing(@service, department_id: @service.department.id)
      else
        render :edit
      end
    end

    def destroy
      @service.destroy
      redirect_to services_url(department_id: @department.id), notice: 'Service was successfully destroyed.'
    end

    private

    def set_department
      if params[:department_id].present?
        @department = Department.find(params[:department_id])
      elsif @service.present? && @service.department.present?
        @department = @service.department
      end
    end

    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:department_id, :parent_id, :title,
                                      :summary, :content, :image, :social_share_image,
                                      :remote_image_url, :image_cache, :remove_image,
                                      :remote_social_share_image_url, :social_share_image_cache,
                                      :remove_social_share_image,
                                      :social_share_title, :social_share_description,
                                      :slug, :suggested_url, :display)
    end
  end
end
