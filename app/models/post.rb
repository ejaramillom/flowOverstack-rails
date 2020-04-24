class Post < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :answers

  belongs_to :user

  validates :name, presence: true, allow_blank: false
	validates :body, presence: true, allow_blank: false

  def voted_by? (user)
		votes.exists?(user: user)
	end
end
