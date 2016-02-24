require 'rails_helper'
#  rspec --tag 'service'
RSpec.describe Service, type: :model, service: true do
  describe 'validations', :validation do
    subject(:service) { build(:service) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:summary) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message('is already taken, leave blank to generate automatically') }
  end

  describe 'associations', :association do
    it { should belong_to(:department).counter_cache }

    it { should have_many(:service_articles).dependent(:destroy) }
    it { should have_many(:articles).through(:service_articles) }

    it { should have_many(:service_downloads).dependent(:destroy) }
    it { should have_many(:downloads).through(:service_downloads) }

    it { should have_many(:service_events).dependent(:destroy) }
    it { should have_many(:events).through(:service_events) }

    it { should have_many(:service_faqs).dependent(:destroy) }
    it { should have_many(:frequently_asked_questions).through(:service_faqs) }

    it { should have_many(:service_offices).dependent(:destroy) }
    it { should have_many(:offices).through(:service_offices) }

    it { should have_many(:service_team_members).dependent(:destroy) }
    it { should have_many(:team_members).through(:service_team_members) }

    it { should have_many(:service_testimonials).dependent(:destroy) }
    it { should have_many(:testimonials).through(:service_testimonials) }

    it { should have_many(:service_related_services).dependent(:destroy) }
    it { should have_many(:related_services).through(:service_related_services) }

    it { should have_many(:service_videos).dependent(:destroy) }
    it { should have_many(:videos).through(:service_videos) }
  end

  describe 'scopes', :scope do
    let(:service) { create(:service) }
    let(:hidden_service) { create(:service, display: false) }

    it 'excludes hidden records' do
      expect(Service.displayed).not_to include hidden_service
    end

    it 'returns displayed records' do
      expect(Service.displayed).to include service
    end
  end

  describe 'friendly id', :friendly_id do
    let(:service) { create(:service) }

    it 'creates a slug if title changed' do
      service.title = 'My new title'
      expect(service.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      service.suggested_url = 'my-new-titled-service'
      expect(service.should_generate_new_friendly_id?).to be true
    end

    it 'does not create slug when other attributes changed' do
      service = create(:service)
      service.content = 'Gobbledegook'
      expect(service.should_generate_new_friendly_id?).to be false
    end
  end

  # https://github.com/beatrichartz/shoulda-callback-matchers
  context 'callbacks' do
    let(:service) { create(:service) }

    it { expect(service).to callback(:set_slug).before(:validation) }
  end
end
