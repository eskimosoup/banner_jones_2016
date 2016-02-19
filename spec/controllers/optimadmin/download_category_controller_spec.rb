require 'rails_helper'

describe Optimadmin::DownloadCategoriesController, type: :controller do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe '#create' do
    context 'when Download category is valid' do
      it 'redirects to index on normal save' do
        download_category = stub_valid_download_category

        post :create, commit: 'Save', download_category: download_category.attributes

        expect(response).to redirect_to(download_categories_path)
        expect(flash[:notice]).to eq('Download category was successfully created.')
      end

      it 'redirects to edit on save and continue editing' do
        download_category = stub_valid_download_category

        post :create, commit: 'Save and continue editing', download_category: download_category.attributes

        expect(response).to redirect_to(edit_download_category_path(download_category))
        expect(flash[:notice]).to eq('Download category was successfully created.')
      end
    end

    context 'when Download category is invalid' do
      it 'renders the edit template' do
        download_category = stub_invalid_download_category

        post :create, commit: 'Save', download_category: download_category.attributes

        expect(response).to render_template(:new)
      end
    end
  end

  describe '#update' do
    context 'when Download category is valid' do
      it 'redirects to index on normal save' do
        download_category = stub_valid_download_category

        patch :update, id: download_category.id, commit: 'Save', download_category: download_category.attributes

        expect(response).to redirect_to(download_categories_path)
        expect(flash[:notice]).to eq('Download category was successfully updated.')
      end

      it 'redirects to edit on save and continue editing' do
        download_category = stub_valid_download_category

        patch :update, id: download_category.id, commit: 'Save and continue editing', download_category: download_category.attributes

        expect(response).to redirect_to(edit_download_category_path(download_category))
        expect(flash[:notice]).to eq('Download category was successfully updated.')
      end
    end

    context 'when Download category is invalid' do
      it 'renders the edit template' do
        download_category = stub_invalid_download_category

        patch :update, id: download_category.id, commit: 'Save', download_category: download_category.attributes

        expect(response).to render_template(:edit)
      end
    end
  end

  def stub_valid_download_category
    download_category = build_stubbed(:download_category)
    allow(DownloadCategory).to receive(:new).and_return(download_category)
    allow(download_category).to receive(:save).and_return(true)
    allow(DownloadCategory).to receive(:find).and_return(download_category)
    allow(download_category).to receive(:update).and_return(true)
    download_category
  end

  def stub_invalid_download_category
    download_category = build_stubbed(:download_category)
    allow(DownloadCategory).to receive(:new).and_return(download_category)
    allow(download_category).to receive(:save).and_return(false)
    allow(DownloadCategory).to receive(:find).and_return(download_category)
    allow(download_category).to receive(:update).and_return(false)
    download_category
  end
end
