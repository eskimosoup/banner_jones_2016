require 'rails_helper'

RSpec.describe BlogPostPresenter, type: :presenter, blog_post: true do
  let(:blog_post) { build(:blog_post) }
  subject(:blog_post_presenter) { BlogPostPresenter.new(object: blog_post, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
