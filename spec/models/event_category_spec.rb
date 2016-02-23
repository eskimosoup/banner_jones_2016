require 'rails_helper'
#  rspec --tag 'event_category'
RSpec.describe EventCategory, type: :model, event_category: true do
  describe 'validations', :validation do
    subject(:event_category) { build(:event_category) }
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title).case_insensitive }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message('is already taken, leave blank to generate automatically') }
  end

  describe 'associations', :association do
    it { should have_many(:events).dependent(:nullify) }
  end

  describe 'scopes', :scope do
    let(:event_category) { create(:event_category) }
    let(:hidden_event_category) { create(:event_category, display: false) }

    describe 'displayed' do
      it 'excludes hidden records' do
        expect(EventCategory.displayed).not_to include hidden_event_category
      end

      it 'returns displayed records' do
        expect(EventCategory.displayed).to include event_category
      end
    end
  end

  describe 'friendly id', :friendly_id do
    let(:event_category) { create(:event_category) }

    it 'creates a slug if title changed' do
      event_category.title = 'My new title'
      expect(event_category.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      event_category.suggested_url = 'my-new-titled-event_category'
      expect(event_category.should_generate_new_friendly_id?).to be true
    end
  end

  context 'callbacks' do
    let(:event_category) { create(:event_category) }

    it { expect(event_category).to callback(:set_slug).before(:validation) }
  end
end
