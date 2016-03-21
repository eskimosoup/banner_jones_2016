module Optimadmin
  class ArticlesController < Optimadmin::ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    edit_images_for Article,
                    [
                      [:image, { show: ['fit', 200, 200], index: ['fill', 270, 124] }],
                      [:social_share_image, { show: ['fit', 1200, 600] }]
                    ]

    def index
      @articles = Optimadmin::BaseCollectionPresenter.new(collection: Article.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::ArticlePresenter)
    end

    def show
    end

    def new
      @article = Article.new
    end

    def edit
    end

    def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to_index_or_continue_editing(@article)
      else
        render :new
      end
    end

    def update
      if @article.update(article_params)
        redirect_to_index_or_continue_editing(@article)
      else
        render :edit
      end
    end

    def destroy
      @article.destroy
      redirect_to articles_url, notice: 'Article was successfully destroyed.'
    end

    private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :summary, :content, :image,
                                      :image_cache, :remote_image_url,
                                      :remote_image, :social_share_image_cache,
                                      :remove_social_share_image,
                                      :remote_social_share_image_url,
                                      :social_share_title, :social_share_image,
                                      :social_share_description,
                                      :article_category_id,
                                      :suggested_url, :status, :publish_at, :expire_at, :team_member_id,
                                      :home_page_highlight, service_ids: [])
    end
  end
end
