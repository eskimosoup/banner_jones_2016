require "rails_helper"

describe Optimadmin::DownloadsController, type: :controller do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe "#create" do
    context "when Download is valid" do
      it "redirects to index on normal save" do
        download = stub_valid_download

        post :create, commit: "Save", download: download.attributes

        expect(response).to redirect_to(downloads_path)
        expect(flash[:notice]).to eq("Download was successfully created.")
      end

      it "redirects to edit on save and continue editing" do
        download = stub_valid_download

        post :create, commit: "Save and continue editing", download: download.attributes

        expect(response).to redirect_to(edit_download_path(download))
        expect(flash[:notice]).to eq("Download was successfully created.")
      end
    end

    context "when Download is invalid" do
      it "renders the edit template" do
        download = stub_invalid_download

        post :create, commit: "Save", download: download.attributes

        expect(response).to render_template(:new)
      end
    end
  end

  describe "#update" do
    context "when Download is valid" do
      it "redirects to index on normal save" do
        download = stub_valid_download

        patch :update, id: download.id, commit: "Save", download: download.attributes

        expect(response).to redirect_to(downloads_path)
        expect(flash[:notice]).to eq("Download was successfully updated.")
      end

      it "redirects to edit on save and continue editing" do
        download = stub_valid_download

        patch :update, id: download.id, commit: "Save and continue editing", download: download.attributes

        expect(response).to redirect_to(edit_download_path(download))
        expect(flash[:notice]).to eq("Download was successfully updated.")
      end
    end

    context "when Download is invalid" do
      it "renders the edit template" do
        download = stub_invalid_download

        patch :update, id: download.id, commit: "Save", download: download.attributes

        expect(response).to render_template(:edit)
      end
    end
  end

  def stub_valid_download
    download = build_stubbed(:download)
    allow(Download).to receive(:new).and_return(download)
    allow(download).to receive(:save).and_return(true)
    allow(Download).to receive(:find).and_return(download)
    allow(download).to receive(:update).and_return(true)
    download
  end

  def stub_invalid_download
    download = build_stubbed(:download)
    allow(Download).to receive(:new).and_return(download)
    allow(download).to receive(:save).and_return(false)
    allow(Download).to receive(:find).and_return(download)
    allow(download).to receive(:update).and_return(false)
    download
  end
end
