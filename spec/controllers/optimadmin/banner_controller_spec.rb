require "rails_helper"

describe Optimadmin::BannersController, type: :controller, banner: true do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe "#create" do
    context "when Banner is valid" do
      it "redirects to index on normal save" do
        banner = stub_valid_banner

        post :create, commit: "Save", banner: banner.attributes

        expect(response).to redirect_to(banners_path)
        expect(flash[:notice]).to eq("Banner was successfully created.")
      end

      it "redirects to edit on save and continue editing" do
        banner = stub_valid_banner

        post :create, commit: "Save and continue editing", banner: banner.attributes

        expect(response).to redirect_to(edit_banner_path(banner))
        expect(flash[:notice]).to eq("Banner was successfully created.")
      end
    end

    context "when Banner is invalid" do
      it "renders the edit template" do
        banner = stub_invalid_banner

        post :create, commit: "Save", banner: banner.attributes

        expect(response).to render_template(:new)
      end
    end
  end

  describe "#update" do
    context "when Banner is valid" do
      it "redirects to index on normal save" do
        banner = stub_valid_banner

        patch :update, id: banner.id, commit: "Save", banner: banner.attributes

        expect(response).to redirect_to(banners_path)
        expect(flash[:notice]).to eq("Banner was successfully updated.")
      end

      it "redirects to edit on save and continue editing" do
        banner = stub_valid_banner

        patch :update, id: banner.id, commit: "Save and continue editing", banner: banner.attributes

        expect(response).to redirect_to(edit_banner_path(banner))
        expect(flash[:notice]).to eq("Banner was successfully updated.")
      end
    end

    context "when Banner is invalid" do
      it "renders the edit template" do
        banner = stub_invalid_banner

        patch :update, id: banner.id, commit: "Save", banner: banner.attributes

        expect(response).to render_template(:edit)
      end
    end
  end

  def stub_valid_banner
    banner = build_stubbed(:banner)
    allow(Banner).to receive(:new).and_return(banner)
    allow(banner).to receive(:save).and_return(true)
    allow(Banner).to receive(:find).and_return(banner)
    allow(banner).to receive(:update).and_return(true)
    banner
  end

  def stub_invalid_banner
    banner = build_stubbed(:banner)
    allow(Banner).to receive(:new).and_return(banner)
    allow(banner).to receive(:save).and_return(false)
    allow(Banner).to receive(:find).and_return(banner)
    allow(banner).to receive(:update).and_return(false)
    banner
  end
end
