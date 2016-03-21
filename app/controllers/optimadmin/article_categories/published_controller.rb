module Optimadmin
  module ArticleCategories
    class PublishedController < Optimadmin::ArticleCategoriesController
      layout 'optimadmin/inline_editing'

      def index
        @article_categories = Optimadmin::BaseCollectionPresenter.new(
          collection: ArticleCategory.published
                        .where('title ILIKE ?', "%#{params[:search]}%")
                        .page(params[:page]).per(params[:per_page] || 1),
          view_template: view_context,
          presenter: Optimadmin::ArticleCategoryPresenter
        )
        render 'optimadmin/article_categories/ajax/index'
      end
    end
  end
end
