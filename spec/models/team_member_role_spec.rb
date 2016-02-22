# Basic model spec
# Inspired by https://gist.github.com/kyletcarlson/6234923

require 'rails_helper'
#  rspec --tag 'team_member_role'
RSpec.describe TeamMemberRole, type: :model, team_member_role: true do
  describe 'validations', :validation do
    subject(:team_member_role) { build(:team_member_role) }
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title).case_insensitive }
  end

  describe 'associations', :association do
    it { should have_many(:team_members).dependent(:nullify) }
  end

  describe 'scopes', :scope do
    let(:team_member_role) { create(:team_member_role) }
    let(:hidden_team_member_role) { create(:team_member_role, display: false) }
    let(:team_member) { create(:team_member, team_member_role: team_member_role, display: true) }
    let(:hidden_team_member) { create(:team_member, team_member_role: team_member_role, display: false) }

    it 'only returns displayed' do
      expect(TeamMemberRole.displayed).not_to include hidden_team_member_role
    end

    it 'returns displayed team members' do
      expect(team_member_role.team_members).to include team_member
    end

    it 'does not return hidden team members' do
      expect(team_member_role.team_members).not_to include hidden_team_member
    end
  end
end
