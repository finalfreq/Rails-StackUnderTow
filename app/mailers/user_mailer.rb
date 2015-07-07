class UserMailer < ApplicationMailer
  default :from => 'undertow@gmail.com'
  def signup_confirmation(user)
    @user = user

    mail to: user.email, subject: "Welcome to the UnderTow"
  end

  def question_email(question)
    @question = question
    @user = @question.user
    mail to: @user.email, subject: "#{@question.name} Successfully Asked"
  end

  def answer_email(answer)
    @answer = answer
    @question = @answer.question
    @user = @question.user
    mail to: @user.email, subject: "New answer for: #{@question.name}"
  end
end
