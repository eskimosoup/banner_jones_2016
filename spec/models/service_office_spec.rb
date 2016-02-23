require 'rails_helper'

RSpec.describe ServiceOffice, type: :model do
  describe 'associations', :association do
    it { should belong_to(:service) }
    it { should belong_to(:office) }
  end
end
