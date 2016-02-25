class BlogPostPresenter < BasePresenter
  presents :blog_post
  delegate :id, to: :blog_post
end
