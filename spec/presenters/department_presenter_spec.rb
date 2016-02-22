require 'rails_helper'

RSpec.describe DepartmentPresenter, type: :presenter, department: true do
  let(:department) { build(:department) }
  subject(:department_presenter) { DepartmentPresenter.new(object: department, view_template: view) }
end
