class Answer < ActiveRecord::Base

  belongs_to :question
  belongs_to :user

  validates :body, presence: true

  def answer_email
    UserMailer.answer_email(self).deliver
  end
end
