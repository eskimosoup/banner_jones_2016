require 'rails_helper'

RSpec.describe ConveyancingQuotes::Sale, :type => :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:forename) }
    it { should validate_presence_of(:surname) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price).is_greater_than(0) }
  end

  it { should delegate_method(:fee).to(:conveyancing_calculator) }
  it { should delegate_method(:stamp_duty).to(:stamp_duty_calculator) }
end
