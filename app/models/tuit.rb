# frozen_string_literal: true

class Tuit < ApplicationRecord
  # Associations
  belongs_to :user
  # Comments
  has_many :comments
  has_many :commentators, through: :comments, source: :user

  # Likes
  # has_many :likes
  # has_many :likers, through: :likes, source: :user

  # Validations =>
  validates :body, presence: { message: 'Meme must have a body' }, length: { in: 1..280 }
end
