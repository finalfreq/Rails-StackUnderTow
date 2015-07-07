class AnswersController < ApplicationController
    load_and_authorize_resource param_method: :answer_params
    load_and_authorize_resource :question
  def new
  end

  def create
    if @answer.save
      @question.answers.push(@answer)
      current_user.answers.push(@answer)
      @answer.answer_email
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
    if @answer.update(answer_params)
      flash[:notice] = "Your answer has been updated!"
      redirect_to question_path(@answer.question)
    else
      flash[:alert] = "you suck"
      render :edit
    end
  end

  def destroy

  end
  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
