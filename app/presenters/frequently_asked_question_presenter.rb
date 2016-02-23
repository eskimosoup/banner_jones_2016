class FrequentlyAskedQuestionPresenter < BasePresenter
  presents :frequently_asked_question
  delegate :id, to: :frequently_asked_question
end
