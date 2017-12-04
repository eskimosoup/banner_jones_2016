class ArticlesController < ApplicationController
  before_action :find_article, only: :show
  before_action :load_article_categories

  def index
    @service = Service.find(params[:service_id]) if params[:service_id]
    @articles = (@service.present? ? @service.articles.displayed.page(params[:page]).per(params[:per_page] || 15) : Article.displayed.page(params[:page]).per(params[:per_page] || 15) )
    @article_categories = ArticleCategory.displayed
  end

  def show
    return redirect_to article_path(@article), status: :moved_permanently if request.path != article_path(@article)
    @related_articles = @article.article_categories.first.articles.displayed.where.not(id: @article.id).limit(3)
  end

  private

  def find_article
    @article = Article.displayed.friendly.find(params[:id])
  end

  def load_article_categories
    @article_categories = ArticleCategory.displayed
  end
end
