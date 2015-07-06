class Question < ActiveRecord::Base

  belongs_to :user
  has_many :answers

  validates :name, presence: true
  validates :body, presence: true

  def summarize
    if body.length < 140
      body
    else
      body[0, 140] + "..."
    end
  end
end

# want to take a paragraph, take X words from paragraph and return shortened version.
