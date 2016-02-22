class ArticleCategoryPresenter < BasePresenter
  presents :article_category
  delegate :title, to: :article_category
end
