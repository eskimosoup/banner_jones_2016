# Basic model spec
# Inspired by https://gist.github.com/kyletcarlson/6234923

require 'rails_helper'
#  rspec --tag 'article_category'
RSpec.describe ArticleCategory, type: :model, article_category: true do
  describe 'validations', :validation do
    subject(:article_category) { build(:article_category) }
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title).case_insensitive }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message('is already taken, leave blank to generate automatically') }
  end

  describe 'associations', :association do
    it { should have_many(:articles).dependent(:nullify) }
  end

  describe 'scopes', :scope do
    let(:article_category) { create(:article_category) }
    let(:hidden_article_category) { create(:article_category, display: false) }

    it 'excludes hidden records' do
      expect(ArticleCategory.displayed).not_to include hidden_article_category
    end

    it 'returns displayed records' do
      expect(ArticleCategory.displayed).to include article_category
    end
  end

  describe 'friendly id', :friendly_id do
    let(:article_category) { create(:article_category) }

    it 'creates a slug if title changed' do
      article_category.title = 'My new title'
      expect(article_category.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      article_category.suggested_url = 'my-new-titled-article_category'
      expect(article_category.should_generate_new_friendly_id?).to be true
    end
  end
end
