class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new, :destroy]

  expose_decorated :answer
  expose_decorated :answers,  -> { fetch_answer }

  def create
    if answer.save
      redirect_to answer, notice: 'Answer was successfully created.'
    else
      render :new
    end
  end

  def update
    if answer.update(answer_params)
      redirect_to answer, notice: 'Answer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    answer.destroy
      redirect_to answers_url, notice: 'Answer was successfully destroyed.'
  end

  private

    def fetch_answer
      answers = Answer.all
    end

    def answer_params
      params.require(:answer).permit(:question_id, :question_answer)
    end
end
