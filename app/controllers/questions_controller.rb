class QuestionsController < ApplicationController
  load_and_authorize_resource param_method: :question_params


  def new
    if current_user == nil
      flash[:alert] = "You must login to ask such questions"
      redirect_to :login
    end
  end

  def create
    if @question.save
      current_user.questions.push(@question)
      flash[:notice] = "You're question has been asked!"
      redirect_to question_path(@question)
    else
      flash[:alert] = "There was a problem with your questoin."
      render :new
    end
  end

  def edit
  end

  def index
  end

  def update

  end

  def destroy

  end

  def show
    @answer = Answer.new
  end

private

def question_params
  params.require(:question).permit(:name, :body)
end

end
