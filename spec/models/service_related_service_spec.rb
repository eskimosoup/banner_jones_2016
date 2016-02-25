require 'rails_helper'

RSpec.describe ServiceRelatedService, type: :model do
  describe 'validations', :validation do
    subject(:service_related_service) { build(:service_related_service) }
    it { should validate_presence_of(:service) }
    it { should validate_presence_of(:related_service) }
  end

  describe 'associations', :association do
    it { should belong_to(:service) }
    it { should belong_to(:related_service) }
  end

  describe 'delegating', :delegation do
    it { should delegate_method(:name).to(:related_service).with_prefix }
  end
end
