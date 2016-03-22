module Optimadmin
  module ArticleCategories
    class ScheduledController < Optimadmin::ArticleCategoriesController
      def index
        display_status_helper

        @pagination_helper = @scheduled_items
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
