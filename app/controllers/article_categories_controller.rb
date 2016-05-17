class ArticleCategoriesController < ApplicationController
  before_action :find_article_category

  def show
    return redirect_to article_category_path(@article_category), status: :moved_permanently if request.path != article_category_path(@article_category)
    @articles = @article_category.articles.displayed.page(params[:page]).per(params[:per_page] || 15)
    @article_categories = ArticleCategory.displayed
    render 'articles/index'
  end

  private

  def find_article_category
    @article_category = ArticleCategory.displayed.friendly.find(params[:id])
  end
end
