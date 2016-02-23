require 'rails_helper'

RSpec.describe FrequentlyAskedQuestionPresenter, type: :presenter, frequently_asked_question: true do
  let(:frequently_asked_question) { build(:frequently_asked_question) }
  subject(:frequently_asked_question_presenter) { FrequentlyAskedQuestionPresenter.new(object: frequently_asked_question, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
