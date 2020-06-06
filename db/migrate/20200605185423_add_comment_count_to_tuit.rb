class AddCommentCountToTuit < ActiveRecord::Migration[6.0]
  def change
    add_column :tuits, :comment_count, :integer, :default => 0
  end
end
