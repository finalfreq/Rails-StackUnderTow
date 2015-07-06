require 'rails_helper'

describe Question do
  it {should validate_presence_of :name}
  it {should validate_presence_of :body}
  it {should belong_to :user}
  it {should have_many :answers}

  it 'will summarize a body of text' do
    question = FactoryGirl.create(:question, body: '1235678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789')
    question.summarize.length.should eq 143
  end
end
