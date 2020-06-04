class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.references :followed, index: true , foreign_key: {to_table: :users}
      t.references :follower, index: true , foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
