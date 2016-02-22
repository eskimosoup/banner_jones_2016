class ArticlePresenter < BasePresenter
  presents :article
  delegate :title, to: :article

  def linked_text(text = 'View', options = {})
    h.link_to text, article, options
  end

  def summary
    h.simple_format article.summary
  end

  def content
    h.raw article.content
  end

  def social_share_image_url
    h.root_url[0..-2] + article.social_share_image.show.url if article.social_share_image.present?
  end

  def social_share_title
    article.social_share_title || article.title
  end

  def social_share_description
    article.social_share_description || article.summary
  end

  def date(format = :default)
    h.l article.date, format: format
  end
end
