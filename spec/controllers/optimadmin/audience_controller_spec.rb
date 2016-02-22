require "rails_helper"

describe Optimadmin::AudiencesController, type: :controller do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe "#create" do
    context "when Audience is valid" do
      it "redirects to index on normal save" do
        audience = stub_valid_audience

        post :create, commit: "Save", audience: audience.attributes

        expect(response).to redirect_to(audiences_path)
        expect(flash[:notice]).to eq("Audience was successfully created.")
      end

      it "redirects to edit on save and continue editing" do
        audience = stub_valid_audience

        post :create, commit: "Save and continue editing", audience: audience.attributes

        expect(response).to redirect_to(edit_audience_path(audience))
        expect(flash[:notice]).to eq("Audience was successfully created.")
      end
    end

    context "when Audience is invalid" do
      it "renders the edit template" do
        audience = stub_invalid_audience

        post :create, commit: "Save", audience: audience.attributes

        expect(response).to render_template(:new)
      end
    end
  end

  describe "#update" do
    context "when Audience is valid" do
      it "redirects to index on normal save" do
        audience = stub_valid_audience

        patch :update, id: audience.id, commit: "Save", audience: audience.attributes

        expect(response).to redirect_to(audiences_path)
        expect(flash[:notice]).to eq("Audience was successfully updated.")
      end

      it "redirects to edit on save and continue editing" do
        audience = stub_valid_audience

        patch :update, id: audience.id, commit: "Save and continue editing", audience: audience.attributes

        expect(response).to redirect_to(edit_audience_path(audience))
        expect(flash[:notice]).to eq("Audience was successfully updated.")
      end
    end

    context "when Audience is invalid" do
      it "renders the edit template" do
        audience = stub_invalid_audience

        patch :update, id: audience.id, commit: "Save", audience: audience.attributes

        expect(response).to render_template(:edit)
      end
    end
  end

  def stub_valid_audience
    audience = build_stubbed(:audience)
    allow(Audience).to receive(:new).and_return(audience)
    allow(audience).to receive(:save).and_return(true)
    allow(Audience).to receive(:find).and_return(audience)
    allow(audience).to receive(:update).and_return(true)
    audience
  end

  def stub_invalid_audience
    audience = build_stubbed(:audience)
    allow(Audience).to receive(:new).and_return(audience)
    allow(audience).to receive(:save).and_return(false)
    allow(Audience).to receive(:find).and_return(audience)
    allow(audience).to receive(:update).and_return(false)
    audience
  end
end
