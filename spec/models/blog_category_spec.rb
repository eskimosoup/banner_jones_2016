require 'rails_helper'
#  rspec --tag 'blog_category'
RSpec.describe BlogCategory, type: :model, blog_category: true do
  describe 'validations', :validation do
    subject(:blog_category) { build(:blog_category) }
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title).case_insensitive }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message('is already taken, leave blank to generate automatically') }
  end

  describe 'associations', :association do
    it { should have_many(:blog_posts).dependent(:nullify) }
  end

  describe 'scopes', :scope do
    let(:blog_category) { create(:blog_category) }
    let(:hidden_blog_category) { create(:blog_category, display: false) }

    describe 'displayed' do
      it 'excludes hidden records' do
        expect(BlogCategory.displayed).not_to include hidden_blog_category
      end

      it 'returns displayed records' do
        expect(BlogCategory.displayed).to include blog_category
      end
    end
  end

  describe 'friendly id', :friendly_id do
    let(:blog_category) { create(:blog_category) }

    it 'creates a slug if title changed' do
      blog_category.title = 'My new title'
      expect(blog_category.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      blog_category.suggested_url = 'my-new-titled-blog_category'
      expect(blog_category.should_generate_new_friendly_id?).to be true
    end

    it 'does not create slug when other attributes changed' do
      blog_category = create(:blog_category)
      blog_category.display = false
      expect(blog_category.should_generate_new_friendly_id?).to be false
    end
  end

  # https://github.com/beatrichartz/shoulda-callback-matchers
  context 'callbacks' do
    let(:blog_category) { create(:blog_category) }
    it { expect(blog_category).to callback(:set_slug).before(:validation) }
  end
end
