class CreateTuits < ActiveRecord::Migration[6.0]
  def change
    create_table :tuits do |t|
      t.references :user, null: false, foreign_key: true
      t.string :body
      t.integer :like_count, default: 0

      t.timestamps
    end
  end
end
