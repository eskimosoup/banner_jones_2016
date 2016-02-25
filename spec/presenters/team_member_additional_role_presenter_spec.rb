require 'rails_helper'

RSpec.describe TeamMemberAdditionalRolePresenter, type: :presenter, team_member_additional_role: true do
  let(:team_member_additional_role) { build(:team_member_additional_role) }
  subject(:team_member_additional_role_presenter) { TeamMemberAdditionalRolePresenter.new(object: team_member_additional_role, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
