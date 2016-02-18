require "rails_helper"

RSpec.describe OfficeLocationPresenter, type: :presenter do
  let(:office_location) { build(:office_location) }
  subject(:office_location_presenter) { OfficeLocationPresenter.new(object: office_location, view_template: view) }

  describe "delegations", :delegation do
    it { should delegate_method(:name).to(:office_location) }
  end

end
