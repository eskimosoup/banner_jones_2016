module Optimadmin
  module ArticleCategories
    class ExpiredController < Optimadmin::ArticleCategoriesController
      def index
        @pagination_helper = @expired_items
                             .pagination(params[:page], params[:per_page])

        @article_categories = Optimadmin::BaseCollectionPresenter.new(
          collection: @pagination_helper,
          view_template: view_context,
          presenter: Optimadmin::ArticleCategoryPresenter
        )
      end
    end
  end
end
