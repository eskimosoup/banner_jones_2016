require 'rails_helper'

RSpec.describe ServiceEvent, type: :model do
  describe 'associations', :association do
    it { should belong_to(:service) }
    it { should belong_to(:event) }
  end
end
