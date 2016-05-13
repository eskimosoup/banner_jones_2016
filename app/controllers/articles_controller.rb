class ArticlesController < ApplicationController
  before_action :find_article, only: :show
  before_action :load_article_categories

  def index
    @articles = Article.displayed
    @article_categories = ArticleCategory.displayed
  end

  def show
    return redirect_to article_path(@article), status: :moved_permanently if request.path != article_path(@article)
  end

  private

  def find_article
    @article = Article.displayed.friendly.find(params[:id])
  end

  def load_article_categories
    @article_categories = ArticleCategory.displayed
  end
end
