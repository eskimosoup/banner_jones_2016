require 'rails_helper'

RSpec.describe BlogCategoryPresenter, type: :presenter, blog_category: true do
  let(:blog_category) { build(:blog_category) }
  subject(:blog_category_presenter) { BlogCategoryPresenter.new(object: blog_category, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
