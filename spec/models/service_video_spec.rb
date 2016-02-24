require 'rails_helper'

RSpec.describe ServiceVideo, type: :model do
  describe 'associations', :association do
    it { should belong_to(:service) }
    it { should belong_to(:video) }
  end
end
