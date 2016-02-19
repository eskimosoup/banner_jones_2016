require 'rails_helper'
#  rspec --tag 'download_category'
RSpec.describe DownloadCategory, type: :model, download_category: true do
  describe 'validations', :validation do
    subject(:download_category) { build(:download_category) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message('is already taken, leave blank to generate automatically') }
  end

  describe 'associations', :association do
    it { should have_many(:downloads).dependent(:nullify) }
  end

  describe 'scopes', :scope do
    let(:download_category) { create(:download_category) }
    let(:hidden_download_category) { create(:download_category, display: false) }

    it 'excludes hidden records' do
      expect(DownloadCategory.displayed).not_to include hidden_download_category
    end

    it 'returns displayed records' do
      expect(DownloadCategory.displayed).to include download_category
    end
  end

  describe 'friendly id', :friendly_id do
    let(:download_category) { create(:download_category) }

    it 'creates a slug if title changed' do
      download_category.name = 'My new title'
      expect(download_category.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      download_category.suggested_url = 'my-new-titled-download_category'
      expect(download_category.should_generate_new_friendly_id?).to be true
    end
  end
end
