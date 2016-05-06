require 'rails_helper'

RSpec.describe ConveyancingQuotes::SaleAndPurchase, :type => :model do
  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:forename) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:purchase_price) }
    it { should validate_numericality_of(:purchase_price).is_greater_than(0) }
    it { should validate_presence_of(:sale_price) }
    it { should validate_numericality_of(:sale_price).is_greater_than(0) }
    it { should validate_presence_of(:surname) }
    it { should validate_presence_of(:title) }
  end

  it { should delegate_method(:sale_fee).to(:sale_conveyancing_calculator).as(:fee) }
  it { should delegate_method(:purchase_fee).to(:purchase_conveyancing_calculator).as(:fee) }
  it { should delegate_method(:stamp_duty).to(:stamp_duty_calculator) }
end
