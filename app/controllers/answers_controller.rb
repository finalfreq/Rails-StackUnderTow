class AnswersController < ApplicationController
    load_and_authorize_resource param_method: :answer_params
    load_and_authorize_resource :question
  def new
  end

  def create
    if @answer.save
      @question.answers.push(@answer)
      current_user.answers.push(@answer)
      redirect_to question_path(@question)
      flash[:notice] = "Your answer has been submitted!"
    else
      flash[:alert] = "There was a problem with your answer - form empty"
      redirect_to question_path(@question)
    end

  end
  def edit

  end

  def update

  end

  def destroy

  end
  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
