class Tuit < ApplicationRecord
  belongs_to :user
  # Comments
  has_many :comments
  has_many :commentators, through: :comments, source: :user

  # Likes
  # has_many :likes
  # has_many :likers, through: :likes, source: :user

  # Validations =>
  validates :body,presence: { message: 'Meme must have a body' }, length: { in:1..280 }
  validates :title, presence: { message: 'Meme must have a title'}

end
