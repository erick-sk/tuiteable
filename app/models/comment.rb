class Comment < ApplicationRecord
  belongs_to :tuit
  belongs_to :user

  validates :body,presence: { message: 'Meme must have a body' }, length: { in:1..280 }
end