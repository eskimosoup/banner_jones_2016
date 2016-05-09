require 'rails_helper'

RSpec.describe ConveyancingQuotes::EquityTransfer, :type => :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:forename) }
    it { should validate_presence_of(:surname) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price).is_greater_than(0) }
  end

  it "#fee" do
    remortgage = ConveyancingQuotes::Remortgage.new

    expect(remortgage.fee).to eq(395.00)
  end

  it "#vat" do
    ConveyancingCalculator.configuration.vat_rate = 0.2
    remortgage = ConveyancingQuotes::Remortgage.new

    expect(remortgage.vat).to eq(79.00)
  end

  it "#total" do
    remortgage = ConveyancingQuotes::Remortgage.new
    allow(remortgage).to receive(:vat).and_return(5)
    allow(remortgage).to receive(:fee).and_return(5)

    expect(remortgage.total).to eq(10)
  end
end
