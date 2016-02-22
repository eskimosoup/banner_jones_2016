module Optimadmin
  class AudiencesController < Optimadmin::ApplicationController
    before_action :set_audience, only: [:show, :edit, :update, :destroy]

    def index
      @audiences = Optimadmin::BaseCollectionPresenter.new(collection: Audience.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::AudiencePresenter)
    end

    def show
    end

    def new
      @audience = Audience.new
    end

    def edit
    end

    def create
      @audience = Audience.new(audience_params)
      if @audience.save
        redirect_to_index_or_continue_editing(@audience)
      else
        render :new
      end
    end

    def update
      if @audience.update(audience_params)
        redirect_to_index_or_continue_editing(@audience)
      else
        render :edit
      end
    end

    def destroy
      @audience.destroy
      redirect_to audiences_url, notice: 'Audience was successfully destroyed.'
    end

    private

    def set_audience
      @audience = Audience.find(params[:id])
    end

    def audience_params
      params.require(:audience).permit(:title, :display, :suggested_url)
    end
  end
end
