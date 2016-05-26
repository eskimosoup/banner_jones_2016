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
      other_team_members = create_list(:team_member, 5, forename: "Jane", surname: "Doe", services: [root_service])

      visit team_member_path(team_member)

      expect(page).to have_content team_member.forename
      expect(page).to have_content team_member.surname
      within ".team-members-index-content" do
        other_team_members.each do |other_team_member|
          expect(page).to have_content other_team_member.forename
          expect(page).to have_content other_team_member.surname
        end
        expect(page).not_to have_content team_member.forename
        expect(page).not_to have_content team_member.surname
      end
    end
  end
end
