module Optimadmin
  class BannersController < Optimadmin::ApplicationController
    before_action :set_banner, only: [:show, :edit, :update, :destroy]

    def index
      @banners = Optimadmin::BaseCollectionPresenter.new(collection: Banner.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::BannerPresenter)
    end

    def show
    end

    def new
      @banner = Banner.new
    end

    def edit
    end

    def create
      @banner = Banner.new(banner_params)
      if @banner.save
        redirect_to_index_or_continue_editing(@banner)
      else
        render :new
      end
    end

    def update
      if @banner.update(banner_params)
        redirect_to_index_or_continue_editing(@banner)
      else
        render :edit
      end
    end

    def destroy
      @banner.destroy
      redirect_to banners_url, notice: 'Banner was successfully destroyed.'
    end

    private

    def set_banner
      @banner = Banner.find(params[:id])
    end

    def banner_params
      params.require(:banner).permit(:position, :title, :summary, :image,
                                     :remote_image_url, :remove_image, :image_cache,
                                     :button_text, :button_link, :display)
    end
  end
end
