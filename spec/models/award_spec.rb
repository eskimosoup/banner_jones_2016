require 'rails_helper'
#  rspec --tag 'award'
RSpec.describe Award, type: :model, award: true do
  describe 'validations', :validation do
    let(:award) { create(:award) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:image) }
  end

  describe 'scopes', :scope do
    let(:award) { create(:award) }
    let(:hidden_award) { create(:award, display: false) }

    it 'excludes hidden records' do
      expect(Award.displayed).not_to include hidden_award
    end

    it 'returns displayed records' do
      expect(Award.displayed).to include award
    end
  end
end
