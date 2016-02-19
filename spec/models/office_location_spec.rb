require 'rails_helper'
#  rspec --tag 'office_location'
RSpec.describe OfficeLocation, type: :model, office_location: true do
  describe 'validations', :validation do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive.with_message('already exists') }
  end

  describe 'associations', :association do
    it { should have_many(:offices).dependent(:destroy) }
  end

  describe 'scopes', :scope do
    let(:office_location) { create(:office_location) }
    let(:hidden_office_location) { create(:office_location, display: false) }

    it 'excludes hidden records' do
      expect(OfficeLocation.displayed).not_to include hidden_office_location
    end

    it 'returns displayed records' do
      expect(OfficeLocation.displayed).to include office_location
    end
  end
end
