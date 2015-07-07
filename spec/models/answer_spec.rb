require 'rails_helper'

describe Answer do
  it {should validate_presence_of :body}
  it {should belong_to :question}
  it {should belong_to :user}

  it "sends an email when the question is created" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question)
    answer = FactoryGirl.create(:answer)
    user.questions.push(question)
    user.answers.push(answer)
    question.answers.push(answer)
    answer.answer_email
    ActionMailer::Base.deliveries.last.to.should eq [user.email]
  end
end
