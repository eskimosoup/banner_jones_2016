require 'rails_helper'
#  rspec --tag 'audience'
RSpec.describe Audience, type: :model, audience: true do
  describe 'validations', :validation do
    subject(:audience) { build(:audience) }
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title).case_insensitive }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message('is already taken, leave blank to generate automatically') }
  end

  describe 'associations', :association do
    it { should have_many(:departments).dependent(:destroy) }
    it { should have_many(:services).through(:departments) }
  end

  describe 'scopes', :scope do
    let(:audience) { create(:audience) }
    let(:hidden_audience) { create(:audience, display: false) }

    it 'excludes hidden records' do
      expect(Audience.displayed).not_to include hidden_audience
    end

    it 'returns displayed records' do
      expect(Audience.displayed).to include audience
    end
  end

  describe 'friendly id', :friendly_id do
    let(:audience) { create(:audience) }

    it 'creates a slug if title changed' do
      audience.title = 'My new title'
      expect(audience.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      audience.suggested_url = 'my-new-titled-audience'
      expect(audience.should_generate_new_friendly_id?).to be true
    end
  end
end
