require 'rails_helper'
#  rspec --tag 'blog_post'
RSpec.describe BlogPost, type: :model, blog_post: true do
  describe 'validations', :validation do
    subject(:blog_post) { build(:blog_post) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:blog_category) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:date) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message('is already taken, leave blank to generate automatically') }

    context 'should not validate presence if not a new record' do
      before { allow(blog_post).to receive(:new_record?).and_return(false) }
      it { should_not validate_presence_of(:blog_category) }
    end
  end

  describe 'custom validation', :validation do
    subject(:blog_post) { build(:blog_post) }

    it 'ensures dates are in the future' do
      blog_post.date = Date.yesterday
      expect(blog_post.valid?).to be false
      expect(blog_post.errors[:date]).to include('can not be in the past')
    end
  end

  describe 'associations', :association do
    it { should belong_to(:blog_category) }
    it { should belong_to(:team_member) }
  end

  describe 'scopes', :scope do
    let(:blog_post) { create(:blog_post) }
    let(:hidden_blog_post) { create(:blog_post, display: false) }
    let(:future_blog_post) { create(:blog_post, date: Date.tomorrow) }

    describe 'displayed' do
      it 'excludes hidden records' do
        expect(BlogPost.displayed).not_to include hidden_blog_post
      end

      it 'excludes future records' do
        expect(BlogPost.displayed).not_to include future_blog_post
      end

      it 'returns displayed records' do
        expect(BlogPost.displayed).to include blog_post
      end
    end
  end

  describe 'friendly id', :friendly_id do
    let(:blog_post) { create(:blog_post) }

    it 'creates a slug if title changed' do
      blog_post.title = 'My new title'
      expect(blog_post.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      blog_post.suggested_url = 'my-new-titled-blog_post'
      expect(blog_post.should_generate_new_friendly_id?).to be true
    end

    it 'does not create slug when other attributes changed' do
      blog_post = create(:blog_post)
      blog_post.display = false
      expect(blog_post.should_generate_new_friendly_id?).to be false
    end
  end

  # https://github.com/beatrichartz/shoulda-callback-matchers
  context 'callbacks' do
    let(:blog_post) { create(:blog_post) }
    it { expect(blog_post).to callback(:set_slug).before(:validation) }
  end
end
