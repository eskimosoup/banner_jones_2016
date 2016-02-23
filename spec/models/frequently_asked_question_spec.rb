require 'rails_helper'
#  rspec --tag 'frequently_asked_question'
RSpec.describe FrequentlyAskedQuestion, type: :model, frequently_asked_question: true do
  describe 'validations', :validation do
    subject(:frequently_asked_question) { build(:frequently_asked_question) }
    it { should validate_presence_of(:question) }
    it { should validate_presence_of(:answer) }
  end

  describe 'associations', :association do
    it { should have_many(:service_faqs).dependent(:destroy) }
    it { should have_many(:services).through(:service_faqs) }
  end

  describe 'scopes', :scope do
    let(:frequently_asked_question) { create(:frequently_asked_question) }
    let(:hidden_frequently_asked_question) { create(:frequently_asked_question, display: false) }

    describe 'displayed' do
      it 'excludes hidden records' do
        expect(FrequentlyAskedQuestion.displayed).not_to include hidden_frequently_asked_question
      end

      it 'returns displayed records' do
        expect(FrequentlyAskedQuestion.displayed).to include frequently_asked_question
      end
    end
  end
end
