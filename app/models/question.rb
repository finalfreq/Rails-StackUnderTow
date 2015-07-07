class Question < ActiveRecord::Base

  belongs_to :user
  has_many :answers

  validates :name, presence: true
  validates :body, presence: true


  def summarize
    words = body.split(' ')
    summary = []
    if body.length < 200
      body
    else
      index = 0
      until summary.join(' ').length > 200
        summary.push(words[index])
        index += 1
      end
    summary.join(' ') + ' ...'
    end
  end

  def question_email
    UserMailer.question_email(self).deliver
  end
end
