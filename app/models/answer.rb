class Answer < ActiveRecord::Base

  belongs_to :question
  belongs_to :user

  default_scope { order('created_at DESC')}
  validates :body, presence: true

  def answer_email
    UserMailer.answer_email(self).deliver
  end
end
