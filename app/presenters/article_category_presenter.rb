class ArticleCategoryPresenter < BasePresenter
  presents :article_category
  delegate :name, to: :article_category
end
