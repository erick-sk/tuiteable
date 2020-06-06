class Like < ApplicationRecord
  belongs_to :tuit, counter_cache: :like_count
  belongs_to :user
end
