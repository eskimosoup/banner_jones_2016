require 'rails_helper'

RSpec.describe Office, type: :model, office: true do
  subject(:office) { build(:office) }

  describe 'validations', :validation do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:office_location_id) }
    it { should validate_presence_of(:office_location) }
    it { should validate_presence_of(:postcode) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive }
  end

  describe 'associations', :association do
    it { should belong_to(:office_location) }

    it { should have_many(:service_offices).dependent(:destroy) }
    it { should have_many(:services).through(:service_offices) }

    it { should have_many(:team_member_offices).dependent(:destroy) }
    it { should have_many(:team_members).through(:team_member_offices) }
  end

  describe 'scopes', :scope do
    let(:office) { create(:office) }
    let(:hidden_office) { create(:office, display: false) }

    describe 'displayed' do
      it 'excludes hidden records' do
        expect(Office.displayed).not_to include hidden_office
      end

      it 'returns displayed records' do
        expect(Office.displayed).to include office
      end
    end
  end

  describe 'delegations', :delegation do
    it { should delegate_method(:name).to(:office_location).with_prefix }
  end

  describe 'friendly_id' do
    let(:office) { create(:office) }

    it 'creates a slug if title changed' do
      office.name = 'My new title'
      expect(office.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      office.suggested_url = 'my-new-titled-office'
      expect(office.should_generate_new_friendly_id?).to be true
    end

    it 'does not create slug when other attributes changed' do
      office = create(:office)
      office.postcode = 'Gobbledegook'
      expect(office.should_generate_new_friendly_id?).to be false
    end
  end

  # https://github.com/beatrichartz/shoulda-callback-matchers
  context 'callbacks' do
    let(:office) { create(:office) }

    it { expect(office).to callback(:set_slug).before(:validation) }
  end
end
