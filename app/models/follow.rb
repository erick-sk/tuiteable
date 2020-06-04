class Follow < ApplicationRecord
  belongs_to :follower, class_name:'User', foreign_key: :follower_id, counter_cache: :follow_count
  belongs_to :followed, class_name: 'User', foreign_key: :followed_id, counter_cache: :follower_count
end
