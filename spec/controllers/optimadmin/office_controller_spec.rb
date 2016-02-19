require "rails_helper"

describe Optimadmin::OfficesController, type: :controller do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe "#create" do
    context "when Office is valid" do
      it "redirects to index on normal save" do
        office = stub_valid_office

        post :create, commit: "Save", office: office.attributes

        expect(response).to redirect_to(offices_path)
        expect(flash[:notice]).to eq("Office was successfully created.")
      end

      it "redirects to edit on save and continue editing" do
        office = stub_valid_office

        post :create, commit: "Save and continue editing", office: office.attributes

        expect(response).to redirect_to(edit_office_path(office))
        expect(flash[:notice]).to eq("Office was successfully created.")
      end
    end

    context "when Office is invalid" do
      it "renders the edit template" do
        office = stub_invalid_office

        post :create, commit: "Save", office: office.attributes

        expect(response).to render_template(:new)
      end
    end
  end

  describe "#update" do
    context "when Office is valid" do
      it "redirects to index on normal save" do
        office = stub_valid_office

        patch :update, id: office.id, commit: "Save", office: office.attributes

        expect(response).to redirect_to(offices_path)
        expect(flash[:notice]).to eq("Office was successfully updated.")
      end

      it "redirects to edit on save and continue editing" do
        office = stub_valid_office

        patch :update, id: office.id, commit: "Save and continue editing", office: office.attributes

        expect(response).to redirect_to(edit_office_path(office))
        expect(flash[:notice]).to eq("Office was successfully updated.")
      end
    end

    context "when Office is invalid" do
      it "renders the edit template" do
        office = stub_invalid_office

        patch :update, id: office.id, commit: "Save", office: office.attributes

        expect(response).to render_template(:edit)
      end
    end
  end

  def stub_valid_office
    office = build_stubbed(:office)
    allow(Office).to receive(:new).and_return(office)
    allow(office).to receive(:save).and_return(true)
    allow(Office).to receive(:find).and_return(office)
    allow(office).to receive(:update).and_return(true)
    office
  end

  def stub_invalid_office
    office = build_stubbed(:office)
    allow(Office).to receive(:new).and_return(office)
    allow(office).to receive(:save).and_return(false)
    allow(Office).to receive(:find).and_return(office)
    allow(office).to receive(:update).and_return(false)
    office
  end
end
