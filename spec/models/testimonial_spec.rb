require 'rails_helper'
#  rspec --tag 'testimonial'
RSpec.describe Testimonial, type: :model, testimonial: true do
  describe 'validations', :validation do
    subject(:testimonial) { build(:testimonial) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:author_name) }
  end

  describe 'scopes', :scope do
    let(:testimonial) { create(:testimonial) }
    let(:hidden_testimonial) { create(:testimonial, display: false) }

    it 'only returns displayed' do
      expect(Testimonial.displayed).not_to include hidden_testimonial
    end
  end
end
