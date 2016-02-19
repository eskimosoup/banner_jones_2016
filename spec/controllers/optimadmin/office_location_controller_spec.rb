require "rails_helper"

describe Optimadmin::OfficeLocationsController, type: :controller do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe "#create" do
    context "when Office location is valid" do
      it "redirects to index on normal save" do
        office_location = stub_valid_office_location

        post :create, commit: "Save", office_location: office_location.attributes

        expect(response).to redirect_to(office_locations_path)
        expect(flash[:notice]).to eq("Office location was successfully created.")
      end

      it "redirects to edit on save and continue editing" do
        office_location = stub_valid_office_location

        post :create, commit: "Save and continue editing", office_location: office_location.attributes

        expect(response).to redirect_to(edit_office_location_path(office_location))
        expect(flash[:notice]).to eq("Office location was successfully created.")
      end
    end

    context "when Office location is invalid" do
      it "renders the edit template" do
        office_location = stub_invalid_office_location

        post :create, commit: "Save", office_location: office_location.attributes

        expect(response).to render_template(:new)
      end
    end
  end

  describe "#update" do
    context "when Office location is valid" do
      it "redirects to index on normal save" do
        office_location = stub_valid_office_location

        patch :update, id: office_location.id, commit: "Save", office_location: office_location.attributes

        expect(response).to redirect_to(office_locations_path)
        expect(flash[:notice]).to eq("Office location was successfully updated.")
      end

      it "redirects to edit on save and continue editing" do
        office_location = stub_valid_office_location

        patch :update, id: office_location.id, commit: "Save and continue editing", office_location: office_location.attributes

        expect(response).to redirect_to(edit_office_location_path(office_location))
        expect(flash[:notice]).to eq("Office location was successfully updated.")
      end
    end

    context "when Office location is invalid" do
      it "renders the edit template" do
        office_location = stub_invalid_office_location

        patch :update, id: office_location.id, commit: "Save", office_location: office_location.attributes

        expect(response).to render_template(:edit)
      end
    end
  end

  def stub_valid_office_location
    office_location = build_stubbed(:office_location)
    allow(OfficeLocation).to receive(:new).and_return(office_location)
    allow(office_location).to receive(:save).and_return(true)
    allow(OfficeLocation).to receive(:find).and_return(office_location)
    allow(office_location).to receive(:update).and_return(true)
    office_location
  end

  def stub_invalid_office_location
    office_location = build_stubbed(:office_location)
    allow(OfficeLocation).to receive(:new).and_return(office_location)
    allow(office_location).to receive(:save).and_return(false)
    allow(OfficeLocation).to receive(:find).and_return(office_location)
    allow(office_location).to receive(:update).and_return(false)
    office_location
  end
end
