require "rails_helper"

describe Optimadmin::TeamMemberRolesController, type: :controller do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe "#create" do
    context "when Team member role is valid" do
      it "redirects to index on normal save" do
        team_member_role = stub_valid_team_member_role

        post :create, commit: "Save", team_member_role: team_member_role.attributes

        expect(response).to redirect_to(team_member_roles_path)
        expect(flash[:notice]).to eq("Team member role was successfully created.")
      end

      it "redirects to edit on save and continue editing" do
        team_member_role = stub_valid_team_member_role

        post :create, commit: "Save and continue editing", team_member_role: team_member_role.attributes

        expect(response).to redirect_to(edit_team_member_role_path(team_member_role))
        expect(flash[:notice]).to eq("Team member role was successfully created.")
      end
    end

    context "when Team member role is invalid" do
      it "renders the edit template" do
        team_member_role = stub_invalid_team_member_role

        post :create, commit: "Save", team_member_role: team_member_role.attributes

        expect(response).to render_template(:new)
      end
    end
  end

  describe "#update" do
    context "when Team member role is valid" do
      it "redirects to index on normal save" do
        team_member_role = stub_valid_team_member_role

        patch :update, id: team_member_role.id, commit: "Save", team_member_role: team_member_role.attributes

        expect(response).to redirect_to(team_member_roles_path)
        expect(flash[:notice]).to eq("Team member role was successfully updated.")
      end

      it "redirects to edit on save and continue editing" do
        team_member_role = stub_valid_team_member_role

        patch :update, id: team_member_role.id, commit: "Save and continue editing", team_member_role: team_member_role.attributes

        expect(response).to redirect_to(edit_team_member_role_path(team_member_role))
        expect(flash[:notice]).to eq("Team member role was successfully updated.")
      end
    end

    context "when Team member role is invalid" do
      it "renders the edit template" do
        team_member_role = stub_invalid_team_member_role

        patch :update, id: team_member_role.id, commit: "Save", team_member_role: team_member_role.attributes

        expect(response).to render_template(:edit)
      end
    end
  end

  def stub_valid_team_member_role
    team_member_role = build_stubbed(:team_member_role)
    allow(TeamMemberRole).to receive(:new).and_return(team_member_role)
    allow(team_member_role).to receive(:save).and_return(true)
    allow(TeamMemberRole).to receive(:find).and_return(team_member_role)
    allow(team_member_role).to receive(:update).and_return(true)
    team_member_role
  end

  def stub_invalid_team_member_role
    team_member_role = build_stubbed(:team_member_role)
    allow(TeamMemberRole).to receive(:new).and_return(team_member_role)
    allow(team_member_role).to receive(:save).and_return(false)
    allow(TeamMemberRole).to receive(:find).and_return(team_member_role)
    allow(team_member_role).to receive(:update).and_return(false)
    team_member_role
  end
end
