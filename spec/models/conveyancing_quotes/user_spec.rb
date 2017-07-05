require 'rails_helper'

RSpec.describe ConveyancingQuotes::User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:forename) }
    it { should validate_presence_of(:surname) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:email) }
  end
end
