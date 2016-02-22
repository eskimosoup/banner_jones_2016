require "rails_helper"

describe Optimadmin::AwardsController, type: :controller do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe "#create" do
    context "when Award is valid" do
      it "redirects to index on normal save" do
        award = stub_valid_award

        post :create, commit: "Save", award: award.attributes

        expect(response).to redirect_to(awards_path)
        expect(flash[:notice]).to eq("Award was successfully created.")
      end

      it "redirects to edit on save and continue editing" do
        award = stub_valid_award

        post :create, commit: "Save and continue editing", award: award.attributes

        expect(response).to redirect_to(edit_award_path(award))
        expect(flash[:notice]).to eq("Award was successfully created.")
      end
    end

    context "when Award is invalid" do
      it "renders the edit template" do
        award = stub_invalid_award

        post :create, commit: "Save", award: award.attributes

        expect(response).to render_template(:new)
      end
    end
  end

  describe "#update" do
    context "when Award is valid" do
      it "redirects to index on normal save" do
        award = stub_valid_award

        patch :update, id: award.id, commit: "Save", award: award.attributes

        expect(response).to redirect_to(awards_path)
        expect(flash[:notice]).to eq("Award was successfully updated.")
      end

      it "redirects to edit on save and continue editing" do
        award = stub_valid_award

        patch :update, id: award.id, commit: "Save and continue editing", award: award.attributes

        expect(response).to redirect_to(edit_award_path(award))
        expect(flash[:notice]).to eq("Award was successfully updated.")
      end
    end

    context "when Award is invalid" do
      it "renders the edit template" do
        award = stub_invalid_award

        patch :update, id: award.id, commit: "Save", award: award.attributes

        expect(response).to render_template(:edit)
      end
    end
  end

  def stub_valid_award
    award = build_stubbed(:award)
    allow(Award).to receive(:new).and_return(award)
    allow(award).to receive(:save).and_return(true)
    allow(Award).to receive(:find).and_return(award)
    allow(award).to receive(:update).and_return(true)
    award
  end

  def stub_invalid_award
    award = build_stubbed(:award)
    allow(Award).to receive(:new).and_return(award)
    allow(award).to receive(:save).and_return(false)
    allow(Award).to receive(:find).and_return(award)
    allow(award).to receive(:update).and_return(false)
    award
  end
end
