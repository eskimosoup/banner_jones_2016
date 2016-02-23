require 'rails_helper'

RSpec.describe ServiceArticle, type: :model do
  describe 'associations', :association do
    it { should belong_to(:service) }
    it { should belong_to(:article) }
  end
end
