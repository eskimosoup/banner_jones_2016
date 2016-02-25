class BlogCategoryPresenter < BasePresenter
  presents :blog_category
  delegate :id, to: :blog_category
end
