class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "You're question has been asked!"
      redirect_to question_path(@question)
    else
      flash[:alert] = "There was a problem with your questoin."
      render :new
    end
  end

  def index

  end

  def update

  end

  def destroy

  end

  def show
    @question = Question.find(params[:id])

  end

private

def question_params
  params.require(:question).permit(:name, :body)
end

end
