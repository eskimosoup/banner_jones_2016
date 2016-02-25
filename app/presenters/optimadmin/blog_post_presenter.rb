module Optimadmin
  class BlogPostPresenter < Optimadmin::BasePresenter
    presents :blog_post
    delegate :id, :title, to: :blog_post

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.simple_format blog_post.summary
    end
  end
end
