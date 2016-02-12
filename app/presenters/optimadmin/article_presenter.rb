module Optimadmin
  class ArticlePresenter < Optimadmin::BasePresenter
    presents :article
    delegate :id, to: :article

    def title
      article.title
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.simple_format article.summary
    end
  end
end
