require 'rails_helper'
#  rspec --tag 'team_member'
RSpec.describe TeamMember, type: :model, team_member: true do
  describe 'validations', :validation do
    subject(:team_member) { build(:team_member) }
    it { should validate_presence_of(:forename) }
    it { should validate_presence_of(:surname) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message('is already taken, leave blank to generate automatically') }
  end

  describe 'custom validation', :validation do
    subject(:team_member) { build(:team_member) }

    it 'ensures additional roles do not include primary role' do
      team_member.additional_roles = [team_member.team_member_role]
      expect(team_member.valid?).to be false
      expect(team_member.errors[:additional_roles]).to include('can not contain primary role')
    end
  end

  describe 'associations', :association do
    it { should belong_to(:team_member_role) }
    it { should have_many(:team_member_offices).dependent(:destroy) }
    it { should have_many(:offices).through(:team_member_offices) }
    it { should have_many(:articles).dependent(:nullify) }

    it { should have_many(:service_team_members).dependent(:destroy) }
    it { should have_many(:services).through(:service_team_members) }

    it { should have_many(:departments) }
    it { should have_many(:blog_posts).dependent(:nullify) }
  end

  describe 'scopes', :scope do
    let(:team_member) { create(:team_member) }
    let(:hidden_team_member) { create(:team_member, display: false) }
    let(:future_team_member) { create(:team_member, display_from: (Time.now + 7.days)) }
    let(:past_team_member) { create(:team_member, display_until: (Time.now - 7.days)) }

    describe 'displayed' do
      it 'only returns displayed' do
        expect(TeamMember.displayed).not_to include hidden_team_member
      end

      it 'does not return future team members' do
        expect(TeamMember.displayed).not_to include future_team_member
      end

      it 'does not return past team members' do
        expect(TeamMember.displayed).not_to include past_team_member
      end
    end

    describe 'name_search' do
      it 'includes forename in name search' do
        expect(TeamMember.name_search('Forename')).to include team_member
      end

      it 'includes surname in name search' do
        expect(TeamMember.name_search('Surname')).to include team_member
      end

      it 'includes forename and surname in name search' do
        expect(TeamMember.name_search('Forename Surname')).to include team_member
      end

      it 'name search returns nil for non-existant records' do
        expect(TeamMember.name_search('Joe Bloggs')).to_not include team_member
      end
    end
  end

  describe 'friendly_id', :friendly_id do
    let(:team_member) { create(:team_member) }

    it 'creates a slug if forename changed' do
      team_member.forename = 'My new name'
      expect(team_member.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if surname changed' do
      team_member.surname = 'My new name'
      expect(team_member.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      team_member.suggested_url = 'my-new-titled-team_member'
      expect(team_member.should_generate_new_friendly_id?).to be true
    end

    it 'does not create slug when other attributes changed' do
      team_member = create(:team_member)
      team_member.specialisms = 'Gobbledegook'
      expect(team_member.should_generate_new_friendly_id?).to be false
    end
  end

  # https://github.com/beatrichartz/shoulda-callback-matchers
  context 'callbacks' do
    let(:team_member) { create(:team_member) }

    it { expect(team_member).to callback(:set_slug).before(:validation) }
  end
end
