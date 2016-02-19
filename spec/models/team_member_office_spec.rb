# Basic model spec
# Inspired by https://gist.github.com/kyletcarlson/6234923

require 'rails_helper'
#  rspec --tag 'team_member_office'
RSpec.describe TeamMemberOffice, type: :model, team_member_office: true do
  describe 'validations', :validation do
    subject(:team_member_office) { build(:team_member_office) }
    it { should validate_presence_of(:team_member) }
    it { should validate_presence_of(:office) }
  end

  describe 'associations', :association do
    it { should belong_to(:team_member) }
    it { should belong_to(:office) }
  end
end
