require 'rails_helper'
#  rspec --tag 'department'
RSpec.describe Department, type: :model, department: true do
  describe 'validations', :validation do
    subject(:department) { build(:department) }
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message('is already taken, leave blank to generate automatically') }
  end

  describe 'associations', :association do
    it { should belong_to(:audience).counter_cache }
    it { should have_many(:services).dependent(:destroy) }
  end

  describe 'scopes', :scope do
    let(:department) { create(:department) }
    let(:hidden_department) { create(:department, display: false) }

    it 'excludes hidden records' do
      expect(Department.displayed).not_to include hidden_department
    end

    it 'returns displayed records' do
      expect(Department.displayed).to include department
    end
  end

  describe 'friendly id', :friendly_id do
    let(:department) { create(:department) }

    it 'creates a slug if title changed' do
      department.title = 'My new title'
      expect(department.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      department.suggested_url = 'my-new-titled-department'
      expect(department.should_generate_new_friendly_id?).to be true
    end

    it 'does not create slug when other attributes changed' do
      department = create(:department)
      department.summary = 'Gobbledegook'
      expect(department.should_generate_new_friendly_id?).to be false
    end
  end

  # https://github.com/beatrichartz/shoulda-callback-matchers
  context 'callbacks' do
    let(:department) { create(:department) }

    it { expect(department).to callback(:set_slug).before(:validation) }
  end
end
