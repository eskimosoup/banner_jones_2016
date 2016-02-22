require 'rails_helper'

describe Optimadmin::DepartmentsController, type: :controller do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe '#create' do
    context 'when Department is valid' do
      it 'redirects to index on normal save' do
        department = stub_valid_department

        post :create, commit: 'Save', department: department.attributes

        expect(response).to redirect_to(departments_path(audience_id: department.audience.id))
        expect(flash[:notice]).to eq('Department was successfully created.')
      end

      it 'redirects to edit on save and continue editing' do
        department = stub_valid_department

        post :create, commit: 'Save and continue editing', department: department.attributes

        expect(response).to redirect_to(edit_department_path(department, audience_id: department.audience.id))
        expect(flash[:notice]).to eq('Department was successfully created.')
      end
    end

    context 'when Department is invalid' do
      it 'renders the edit template' do
        department = stub_invalid_department

        post :create, commit: 'Save', department: department.attributes

        expect(response).to render_template(:new)
      end
    end
  end

  describe '#update' do
    context 'when Department is valid' do
      it 'redirects to index on normal save' do
        department = stub_valid_department

        patch :update, id: department.id, commit: 'Save', department: department.attributes

        expect(response).to redirect_to(departments_path(audience_id: department.audience.id))
        expect(flash[:notice]).to eq('Department was successfully updated.')
      end

      it 'redirects to edit on save and continue editing' do
        department = stub_valid_department

        patch :update, id: department.id, commit: 'Save and continue editing', department: department.attributes

        expect(response).to redirect_to(edit_department_path(department, audience_id: department.audience.id))
        expect(flash[:notice]).to eq('Department was successfully updated.')
      end
    end

    context 'when Department is invalid' do
      it 'renders the edit template' do
        department = stub_invalid_department

        patch :update, id: department.id, commit: 'Save', department: department.attributes

        expect(response).to render_template(:edit)
      end
    end
  end

  def stub_valid_department
    department = build_stubbed(:department)
    audience = build_stubbed(:audience)
    allow(Department).to receive(:new).and_return(department)
    allow(department).to receive(:save).and_return(true)
    allow(Department).to receive(:find).and_return(department)
    allow(department).to receive(:update).and_return(true)
    department
  end

  def stub_invalid_department
    department = build_stubbed(:department)
    audience = build_stubbed(:audience)
    allow(Department).to receive(:new).and_return(department)
    allow(department).to receive(:save).and_return(false)
    allow(Department).to receive(:find).and_return(department)
    allow(department).to receive(:update).and_return(false)
    department
  end
end
