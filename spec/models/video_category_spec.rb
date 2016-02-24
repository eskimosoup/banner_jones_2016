require 'rails_helper'
#  rspec --tag 'video_category'
RSpec.describe VideoCategory, type: :model, video_category: true do
  describe 'validations', :validation do
    subject(:video_category) { build(:video_category) }
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title).case_insensitive }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message('is already taken, leave blank to generate automatically') }
  end

  describe 'associations', :association do
    it { should have_many(:videos).dependent(:nullify) }
  end

  describe 'scopes', :scope do
    let(:video_category) { create(:video_category) }
    let(:hidden_video_category) { create(:video_category, display: false) }

    describe 'displayed' do
      it 'excludes hidden records' do
        expect(VideoCategory.displayed).not_to include hidden_video_category
      end

      it 'returns displayed records' do
        expect(VideoCategory.displayed).to include video_category
      end
    end
  end

  describe 'friendly id', :friendly_id do
    let(:video_category) { create(:video_category) }

    it 'creates a slug if title changed' do
      video_category.title = 'My new title'
      expect(video_category.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      video_category.suggested_url = 'my-new-titled-video_category'
      expect(video_category.should_generate_new_friendly_id?).to be true
    end

    it 'does not create slug when other attributes changed' do
      video_category = create(:video_category)
      video_category.display = false
      expect(video_category.should_generate_new_friendly_id?).to be false
    end
  end

  # https://github.com/beatrichartz/shoulda-callback-matchers
  context 'callbacks' do
    let(:video_category) { create(:video_category) }
    it { expect(video_category).to callback(:set_slug).before(:validation) }
  end
end
