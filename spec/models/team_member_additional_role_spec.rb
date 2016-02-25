require 'rails_helper'
#  rspec --tag 'team_member_office'
RSpec.describe TeamMemberAdditionalRole, type: :model, team_member_additional_role: true do
  describe 'validations', :validation do
    subject(:team_member_additional_role) { build(:team_member_additional_role) }
    it { should validate_presence_of(:team_member) }
    it { should validate_presence_of(:team_member_role) }
  end

  describe 'associations', :association do
    it { should belong_to(:team_member) }
    it { should belong_to(:team_member_role) }
  end

  describe 'delegating', :delegation do
    it { should delegate_method(:title).to(:team_member_role).with_prefix }
  end
end
