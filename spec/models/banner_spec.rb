require 'rails_helper'
#  rspec --tag 'banner'
RSpec.describe Banner, type: :model, banner: true do
  describe 'validations', :validation do
    let(:banner) { create(:banner) }
    it { should validate_presence_of(:image) }
  end

  describe 'custom validation', :validation do
    let(:banner) { create(:banner) }

    it 'ensures button text if button link' do
      banner.button_link = '#'
      expect(banner.valid?).to be false
      expect(banner.errors[:button_text]).to include("can't be blank if button link is set")
    end

    it 'ensures button text if button link' do
      banner.button_text = '#'
      expect(banner.valid?).to be false
      expect(banner.errors[:button_link]).to include("can't be blank if button text is set")
    end
  end

  describe 'scopes', :scope do
    let(:banner) { create(:banner) }
    let(:hidden_banner) { create(:banner, display: false) }

    describe 'displayed' do
      it 'excludes hidden records' do
        expect(Banner.displayed).not_to include hidden_banner
      end

      it 'returns displayed records' do
        expect(Banner.displayed).to include banner
      end
    end
  end
end
