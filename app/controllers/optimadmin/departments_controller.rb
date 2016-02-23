module Optimadmin
  class DepartmentsController < Optimadmin::ApplicationController
    before_action :set_department, only: [:show, :edit, :update, :destroy]
    before_action :set_audience

    edit_images_for Department,
                    [
                      [:image, { show: ['fit', 200, 200], index: ['fill', 200, 200] }],
                      [:social_share_image, { show: ['fit', 1200, 600] }]
                    ]

    def index
      @departments = Optimadmin::BaseCollectionPresenter.new(collection: Department.where('title ILIKE ? AND audience_id = ?', "%#{params[:search]}%", @audience.id).page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::DepartmentPresenter)
    end

    def show
    end

    def new
      @department = Department.new
    end

    def edit
    end

    def create
      @department = Department.new(department_params)
      if @department.save
        redirect_to_index_or_continue_editing(@department, audience_id: @department.audience.id)
      else
        render :new
      end
    end

    def update
      if @department.update(department_params)
        redirect_to_index_or_continue_editing(@department, audience_id: @department.audience.id)
      else
        render :edit
      end
    end

    def destroy
      @department.destroy
      redirect_to departments_url(audience_id: @audience.id), notice: 'Department was successfully destroyed.'
    end

    private

    def set_department
      @department = Department.find(params[:id])
    end

    def set_audience
      if params[:audience_id].present?
        @audience = Audience.find(params[:audience_id])
      elsif @department.present? && @department.audience.present?
        @audience = @department.audience
      end
    end

    def department_params
      params.require(:department).permit(:audience_id, :title, :summary,
                                         :image_cache, :remote_image_url,
                                         :remote_image, :social_share_image_cache,
                                         :remove_social_share_image,
                                         :remote_social_share_image_url,
                                         :image, :social_share_image,
                                         :team_member_id,
                                         :display, :suggested_url)
    end
  end
end
