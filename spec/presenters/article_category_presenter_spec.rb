require 'rails_helper'

RSpec.describe ArticleCategoryPresenter, type: :presenter, article_category: true do
  let(:article_category) { build(:article_category) }
  subject(:article_category_presenter) { ArticleCategoryPresenter.new(object: article_category, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:name).to(:article_category) }
  end
end
