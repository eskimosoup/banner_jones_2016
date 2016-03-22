module Optimadmin
  module ArticleCategories
    class PublishedController < Optimadmin::ArticleCategoriesController
      def index
        display_status_helper

        @pagination_helper = @published_items
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
