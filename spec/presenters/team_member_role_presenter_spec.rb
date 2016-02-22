# Presenter testing

require 'rails_helper'
#  rspec --tag 'team_member_role'
RSpec.describe TeamMemberRolePresenter, type: :presenter, team_member_role: true do
  let(:team_member_role) { build(:team_member_role) }
  subject(:team_member_role_presenter) { TeamMemberRolePresenter.new(object: team_member_role, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:title).to(:team_member_role) }
  end
end
