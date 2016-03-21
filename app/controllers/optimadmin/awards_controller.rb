module Optimadmin
  class AwardsController < Optimadmin::ApplicationController
    before_action :set_award, only: [:show, :edit, :update, :destroy]

    edit_images_for Award,
                    [
                      [:image, { show: ['fit', 200, 200], index: ['fill', 192, 139] }]
                    ]

    def index
      @awards = Optimadmin::BaseCollectionPresenter.new(collection: Award.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::AwardPresenter)
    end

    def show
    end

    def new
      @award = Award.new
    end

    def edit
    end

    def create
      @award = Award.new(award_params)
      if @award.save
        redirect_to_index_or_continue_editing(@award)
      else
        render :new
      end
    end

    def update
      if @award.update(award_params)
        redirect_to_index_or_continue_editing(@award)
      else
        render :edit
      end
    end

    def destroy
      @award.destroy
      redirect_to awards_url, notice: 'Award was successfully destroyed.'
    end

    private

    def set_award
      @award = Award.find(params[:id])
    end

    def award_params
      params.require(:award).permit(:position, :title,
                                    :remote_image_url, :image_cache,
                                    :remove_image, :image, :link, :status, :publish_at, :expire_at)
    end
  end
end
