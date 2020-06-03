class Comment < ApplicationRecord
  belongs_to :tuit
  belongs_to :user
end
