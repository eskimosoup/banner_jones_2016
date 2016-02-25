module Optimadmin
  class BlogCategoryPresenter < Optimadmin::BasePresenter
    presents :blog_category
    delegate :id, :title, to: :blog_category
  end
end
