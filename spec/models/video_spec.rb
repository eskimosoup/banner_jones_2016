require 'rails_helper'
#  rspec --tag 'video'
RSpec.describe Video, type: :model, video: true do
  describe 'validations', :validation do
    subject(:video) { build(:video) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:embed_code) }
    it { should validate_presence_of(:video_category) }

    context 'should not validate presence if not a new record' do
      before { allow(video).to receive(:new_record?).and_return(false) }
      it { should_not validate_presence_of(:video_category) }
    end
  end

  describe 'associations', :association do
    it { should belong_to(:video_category) }
  end

  describe 'scopes', :scope do
    let(:video) { create(:video) }
    let(:hidden_video) { create(:video, display: false) }

    describe 'displayed' do
      it 'excludes hidden records' do
        expect(Video.displayed).not_to include hidden_video
      end

      it 'returns displayed records' do
        expect(Video.displayed).to include video
      end
    end
  end
end
