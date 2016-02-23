require 'rails_helper'

RSpec.describe ServiceTeamMember, type: :model do
  describe 'associations', :association do
    it { should belong_to(:service) }
    it { should belong_to(:team_member) }
  end
end
