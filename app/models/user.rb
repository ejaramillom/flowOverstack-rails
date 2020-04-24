class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :answers

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
