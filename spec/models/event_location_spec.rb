require 'rails_helper'
#  rspec --tag 'event_location'
RSpec.describe EventLocation, type: :model, event_location: true do
  describe 'validations', :validation do
    subject(:event_location) { build(:event_location) }
    it { should validate_presence_of(:building_name) }
    it { should validate_presence_of(:address_line_1) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:postcode) }
  end

  describe 'associations', :association do
    it { should have_many(:events).dependent(:nullify) }
  end
end
