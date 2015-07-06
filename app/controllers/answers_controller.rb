class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      @question = Question.find(params[:question_id])
      @question.answers.push(@answer)
      current_user.answers.push(@answer)
      redirect_to question_path(@question)
      flash[:notice] = "Your answer has been submitted!"
    else
      flash[:alert] = "There was a problem with your answer"
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
