require 'rails_helper'
#  rspec --tag 'event'
RSpec.describe Event, type: :model, event: true do
  describe 'validations', :validation do
    subject(:event) { build(:event) }
    it { should validate_presence_of(:event_category) }
    it { should validate_presence_of(:event_location) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:event_start) }
    it { should validate_presence_of(:event_end) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message('is already taken, leave blank to generate automatically') }

    context 'if has booking deadline' do
      before { allow(event).to receive(:dates_and_booking_deadline?).and_return(true) }
      it { should validate_presence_of(:booking_link) }
    end

    context 'does not have booking deadline' do
      before { allow(event).to receive(:dates_and_booking_deadline?).and_return(false) }
      it { should_not validate_presence_of(:booking_link) }
    end

    context 'should not validate presence if not a new record (i.e. dependent nullify)' do
      before { allow(event).to receive(:new_record?).and_return(false) }
      it { should_not validate_presence_of(:event_category) }
      it { should_not validate_presence_of(:event_location) }
    end
  end

  describe 'custom validation', :validation do
    subject(:event) { build(:event, event_start: nil, event_end: nil, booking_deadline: nil) }

    it 'ensures start date is in the future' do
      event.event_start = DateTime.now - 1.day
      event.event_end = DateTime.now + 1.hour - 1.day
      expect(event.valid?).to be false
      expect(event.errors[:event_start]).to include("can't be in the past")
    end

    it 'ensures end date is in the future' do
      event.event_start = DateTime.now + 1.day + 1.hour
      event.event_end = DateTime.now + 1.day
      expect(event.valid?).to be false
      expect(event.errors[:event_end]).to include("can't be before event start")
    end

    it 'ensures booking deadline is after start date' do
      event.event_start = DateTime.now + 1.day
      event.event_end = DateTime.now + 1.day + 1.hour
      event.booking_deadline = Date.yesterday
      expect(event.valid?).to be false
      expect(event.errors[:booking_deadline]).to include('must be after the event start')
    end

    it 'ensures booking deadline is before end date' do
      event.event_start = DateTime.now + 1.day
      event.event_end = DateTime.now + 1.day + 1.hour
      event.booking_deadline = DateTime.now + 1.day + 2.hours
      expect(event.valid?).to be false
      expect(event.errors[:booking_deadline]).to include('must be before the event end')
    end
  end

  describe 'associations', :association do
    it { should belong_to(:event_category) }
    it { should belong_to(:event_location) }
  end

  describe 'scopes', :scope do
    let(:event) { create(:event) }
    let(:hidden_event) { create(:event, display: false) }

    describe 'displayed' do
      it 'excludes hidden records' do
        expect(Event.displayed).not_to include hidden_event
      end

      it 'returns displayed records' do
        expect(Event.displayed).to include event
      end
    end
  end

  describe 'friendly id', :friendly_id do
    let(:event) { create(:event) }

    it 'creates a slug if title changed' do
      event.title = 'My new title'
      expect(event.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      event.suggested_url = 'my-new-titled-event'
      expect(event.should_generate_new_friendly_id?).to be true
    end

    it 'does not create slug when other attributes changed' do
      event = create(:event)
      event.content = 'Gobbledegook'
      expect(event.should_generate_new_friendly_id?).to be false
    end
  end

  # https://github.com/beatrichartz/shoulda-callback-matchers
  context 'callbacks' do
    let(:event) { create(:event) }
    it { expect(event).to callback(:set_slug).before(:validation) }
  end
end
