require 'rails_helper'

describe Question do
  it {should validate_presence_of :name}
  it {should validate_presence_of :body}
  it {should belong_to :user}
  it {should have_many :answers}

  it 'will summarize a body of text over 200 char' do
    question = FactoryGirl.create(:question, body: "The allow_mass_assignment_of matcher tests usage of Rails 3's attr_accessible and attr_protected macros, asserting that an attribute in your model is contained in either the whitelist or blacklist and thus can or cannot be set via mass assignment.")
    question.summarize.should eq "The allow_mass_assignment_of matcher tests usage of Rails 3's attr_accessible and attr_protected macros, asserting that an attribute in your model is contained in either the whitelist or blacklist and thus ..."
  end
  it 'will will return body if under 200 char' do
    question = FactoryGirl.create(:question, body: "asserting that an attribute in your model is contained in either the whitelist or blacklist and thus can or cannot be set via mass assignment.")
    question.summarize.should eq "asserting that an attribute in your model is contained in either the whitelist or blacklist and thus can or cannot be set via mass assignment."
  end
  it "sends an email when the question is created" do
    question = FactoryGirl.create(:question)
    question.question_email
    ActionMailer::Base.deliveries.last.to.should eq [question.user.email]
  end

end
