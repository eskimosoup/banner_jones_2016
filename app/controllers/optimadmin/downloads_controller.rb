module Optimadmin
  class DownloadsController < Optimadmin::ApplicationController
    before_action :set_download, only: [:show, :edit, :update, :destroy]

    edit_images_for Download,
                    [
                      [:image, { show: ['fit', 200, 200], index: ['fill', 200, 200] }]
                    ]

    def index
      @downloads = Optimadmin::BaseCollectionPresenter.new(collection: Download.where('name ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::DownloadPresenter)
    end

    def show
    end

    def new
      @download = Download.new
    end

    def edit
    end

    def create
      @download = Download.new(download_params)
      if @download.save
        redirect_to_index_or_continue_editing(@download)
      else
        render :new
      end
    end

    def update
      if @download.update(download_params)
        redirect_to_index_or_continue_editing(@download)
      else
        render :edit
      end
    end

    def destroy
      @download.destroy
      redirect_to downloads_url, notice: 'Download was successfully destroyed.'
    end

    private

    def set_download
      @download = Download.find(params[:id])
    end

    def download_params
      params.require(:download).permit(:name, :summary, :description, :file,
                                       :remote_image_url, :image_cache, :remove_image,
                                       :remote_file_url, :file_cache, :remove_file,
                                       :image, :download_category_id, :suggested_url, :display)
    end
  end
end
