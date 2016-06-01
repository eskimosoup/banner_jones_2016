require 'rails_helper'

RSpec.describe Payment, :type => :model do
  describe "validations" do
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount).is_greater_than(0) }
    it { should validate_presence_of(:contact_number) }
    it { should validate_presence_of(:invoice_number) }
    it { should validate_presence_of(:name) }
  end

  it "#credit_card_amount" do
    payment = Payment.new(amount: 50)

    expect(payment.credit_card_amount).to eq(51.10)
  end
end
