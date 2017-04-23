class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new, :destroy]

  expose_decorated :question
  expose_decorated :questions, -> { fetch_questions }


  def create
    if question.save
      redirect_to question, notice: 'Question was successfully created.'
    else
      render :new
    end
  end


  def update
    if question.update(question_params)
      redirect_to question, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    question.destroy
      redirect_to questions_url, notice: 'Question was successfully destroyed.'
  end

  private
    def fetch_questions
      questions = Question.all
      questions
    end

    def question_params
      params.require(:question).permit(:title, :question)
    end
end
