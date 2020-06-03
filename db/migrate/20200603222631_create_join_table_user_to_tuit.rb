class CreateJoinTableUserToTuit < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :tuits do |t|
      # t.index [:user_id, :tuit_id]
      # t.index [:tuit_id, :user_id]
    end
  end
end
