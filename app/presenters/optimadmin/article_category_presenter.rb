module Optimadmin
  class ArticleCategoryPresenter < Optimadmin::BasePresenter
    presents :article_category
    delegate :id, :title, to: :article_category
  end
end
