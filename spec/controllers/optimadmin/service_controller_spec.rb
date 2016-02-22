require 'rails_helper'

describe Optimadmin::ServicesController, type: :controller do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe '#create' do
    context 'when Service is valid' do
      it 'redirects to index on normal save' do
        service = stub_valid_service

        post :create, commit: 'Save', service: service.attributes

        expect(response).to redirect_to(services_path(department_id: service.department.id))
        expect(flash[:notice]).to eq('Service was successfully created.')
      end

      it 'redirects to edit on save and continue editing' do
        service = stub_valid_service

        post :create, commit: 'Save and continue editing', service: service.attributes

        expect(response).to redirect_to(edit_service_path(service, department_id: service.department_id))
        expect(flash[:notice]).to eq('Service was successfully created.')
      end
    end

    context 'when Service is invalid' do
      it 'renders the edit template' do
        service = stub_invalid_service

        post :create, commit: 'Save', service: service.attributes

        expect(response).to render_template(:new)
      end
    end
  end

  describe '#update' do
    context 'when Service is valid' do
      it 'redirects to index on normal save' do
        service = stub_valid_service

        patch :update, id: service.id, commit: 'Save', service: service.attributes

        expect(response).to redirect_to(services_path(department_id: service.department.id))
        expect(flash[:notice]).to eq('Service was successfully updated.')
      end

      it 'redirects to edit on save and continue editing' do
        service = stub_valid_service

        patch :update, id: service.id, commit: 'Save and continue editing', service: service.attributes

        expect(response).to redirect_to(edit_service_path(service, department_id: service.department.id))
        expect(flash[:notice]).to eq('Service was successfully updated.')
      end
    end

    context 'when Service is invalid' do
      it 'renders the edit template' do
        service = stub_invalid_service

        patch :update, id: service.id, commit: 'Save', service: service.attributes

        expect(response).to render_template(:edit)
      end
    end
  end

  def stub_valid_service
    service = build_stubbed(:service)
    allow(Service).to receive(:new).and_return(service)
    allow(service).to receive(:save).and_return(true)
    allow(Service).to receive(:find).and_return(service)
    allow(service).to receive(:update).and_return(true)
    service
  end

  def stub_invalid_service
    service = build_stubbed(:service)
    allow(Service).to receive(:new).and_return(service)
    allow(service).to receive(:save).and_return(false)
    allow(Service).to receive(:find).and_return(service)
    allow(service).to receive(:update).and_return(false)
    service
  end
end
