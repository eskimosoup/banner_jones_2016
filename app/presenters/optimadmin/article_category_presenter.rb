module Optimadmin
  class ArticleCategoryPresenter < Optimadmin::BasePresenter
    presents :article_category
    delegate :id, :name, to: :article_category
  end
end
