module Optimadmin
  class DownloadCategoriesController < Optimadmin::ApplicationController
    before_action :set_download_category, only: [:show, :edit, :update, :destroy]

    def index
      @download_categories = Optimadmin::BaseCollectionPresenter.new(collection: DownloadCategory.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::DownloadCategoryPresenter)
    end

    def show
    end

    def new
      @download_category = DownloadCategory.new
    end

    def edit
    end

    def create
      @download_category = DownloadCategory.new(download_category_params)
      if @download_category.save
        redirect_to_index_or_continue_editing(@download_category)
      else
        render :new
      end
    end

    def update
      if @download_category.update(download_category_params)
        redirect_to_index_or_continue_editing(@download_category)
      else
        render :edit
      end
    end

    def destroy
      @download_category.destroy
      redirect_to download_categories_url, notice: 'Download category was successfully destroyed.'
    end

    private

    def set_download_category
      @download_category = DownloadCategory.find(params[:id])
    end

    def download_category_params
      params.require(:download_category).permit(:title, :status, :publish_at, :expire_at, :suggested_url)
    end
  end
end
