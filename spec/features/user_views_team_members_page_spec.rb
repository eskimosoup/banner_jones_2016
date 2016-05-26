require "rails_helper"

describe "viewing team members" do
  describe "#show" do
    scenario "has no services" do
      team_member = create(:team_member)

      visit team_member_path(team_member)

      expect(page).to have_content team_member.forename
      expect(page).to have_content team_member.surname
    end

    scenario "has services" do
      audience = create(:audience)
      root_service = create(:service, audience: audience)
      team_member = create(:team_member, forename: "Joe", surname: "Bloggs", services: [root_service])
      other_team_members = create_list(:team_member, 5, services: [root_service])

      visit team_member_path(team_member)

      expect(page).to have_content team_member.forename
      expect(page).to have_content team_member.surname
    end
  end
end
