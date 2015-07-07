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
      @question.question_email
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
    if @question.update(question_params)
      flash[:notice] = "Your question has been updated!"
      redirect_to question_path(@question)
    else
      flash[:alert] = "you suck"
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to root_path
  end

  def show
    @answer = Answer.new
  end

private

def question_params
  params.require(:question).permit(:name, :body)
end

end
