require 'rails_helper'

describe Optimadmin::FrequentlyAskedQuestionsController, type: :controller, frequently_asked_question: true do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe '#create' do
    context 'when Frequently asked question is valid' do
      it 'redirects to index on normal save' do
        frequently_asked_question = stub_valid_frequently_asked_question

        post :create, commit: 'Save', frequently_asked_question: frequently_asked_question.attributes

        expect(response).to redirect_to(frequently_asked_questions_path)
        expect(flash[:notice]).to eq('Frequently asked question was successfully created.')
      end

      it 'redirects to edit on save and continue editing' do
        frequently_asked_question = stub_valid_frequently_asked_question

        post :create, commit: 'Save and continue editing', frequently_asked_question: frequently_asked_question.attributes

        expect(response).to redirect_to(edit_frequently_asked_question_path(frequently_asked_question))
        expect(flash[:notice]).to eq('Frequently asked question was successfully created.')
      end
    end

    context 'when Frequently asked question is invalid' do
      it 'renders the edit template' do
        frequently_asked_question = stub_invalid_frequently_asked_question

        post :create, commit: 'Save', frequently_asked_question: frequently_asked_question.attributes

        expect(response).to render_template(:new)
      end
    end
  end

  describe '#update' do
    context 'when Frequently asked question is valid' do
      it 'redirects to index on normal save' do
        frequently_asked_question = stub_valid_frequently_asked_question

        patch :update, id: frequently_asked_question.id, commit: 'Save', frequently_asked_question: frequently_asked_question.attributes

        expect(response).to redirect_to(frequently_asked_questions_path)
        expect(flash[:notice]).to eq('Frequently asked question was successfully updated.')
      end

      it 'redirects to edit on save and continue editing' do
        frequently_asked_question = stub_valid_frequently_asked_question

        patch :update, id: frequently_asked_question.id, commit: 'Save and continue editing', frequently_asked_question: frequently_asked_question.attributes

        expect(response).to redirect_to(edit_frequently_asked_question_path(frequently_asked_question))
        expect(flash[:notice]).to eq('Frequently asked question was successfully updated.')
      end
    end

    context 'when Frequently asked question is invalid' do
      it 'renders the edit template' do
        frequently_asked_question = stub_invalid_frequently_asked_question

        patch :update, id: frequently_asked_question.id, commit: 'Save', frequently_asked_question: frequently_asked_question.attributes

        expect(response).to render_template(:edit)
      end
    end
  end

  def stub_valid_frequently_asked_question
    frequently_asked_question = build_stubbed(:frequently_asked_question)
    allow(FrequentlyAskedQuestion).to receive(:new).and_return(frequently_asked_question)
    allow(frequently_asked_question).to receive(:save).and_return(true)
    allow(FrequentlyAskedQuestion).to receive(:find).and_return(frequently_asked_question)
    allow(frequently_asked_question).to receive(:update).and_return(true)
    frequently_asked_question
  end

  def stub_invalid_frequently_asked_question
    frequently_asked_question = build_stubbed(:frequently_asked_question)
    allow(FrequentlyAskedQuestion).to receive(:new).and_return(frequently_asked_question)
    allow(frequently_asked_question).to receive(:save).and_return(false)
    allow(FrequentlyAskedQuestion).to receive(:find).and_return(frequently_asked_question)
    allow(frequently_asked_question).to receive(:update).and_return(false)
    frequently_asked_question
  end
end
