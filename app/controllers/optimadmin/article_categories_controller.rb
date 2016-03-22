module Optimadmin
  class ArticleCategoriesController < Optimadmin::ApplicationController
    before_action :set_article_category, only: [:show, :edit, :update, :destroy]

    before_action :display_status, only: :index

    def index
      @pagination_helper = @all_items
                           .pagination(params[:page], params[:per_page])

      @article_categories = Optimadmin::BaseCollectionPresenter.new(
        collection: @pagination_helper,
        view_template: view_context,
        presenter: Optimadmin::ArticleCategoryPresenter
      )
    end

    def show
    end

    def new
      @article_category = ArticleCategory.new
    end

    def edit
    end

    def create
      @article_category = ArticleCategory.new(article_category_params)
      if @article_category.save
        redirect_to_index_or_continue_editing(@article_category)
      else
        render :new
      end
    end

    def update
      if @article_category.update(article_category_params)
        redirect_to_index_or_continue_editing(@article_category)
      else
        render :edit
      end
    end

    def destroy
      @article_category.destroy
      redirect_to article_categories_url, notice: 'Article category was successfully destroyed.'
    end

    private

    def display_status
      @all_items = ArticleCategory.field_order(params[:order])
                                  .field_search(params[:search])
      @scheduled_items = @all_items.scheduled
      @published_items = @all_items.published
      @expired_items   = @all_items.expired
    end

    def set_article_category
      @article_category = ArticleCategory.find(params[:id])
    end

    def article_category_params
      params.require(:article_category).permit(:title, :suggested_url, :status, :publish_at, :expire_at)
    end
  end
end
