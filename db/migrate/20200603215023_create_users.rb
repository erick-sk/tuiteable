# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password
      t.string :name
      t.string :email, null: false
      t.string :location
      t.string :bio
      t.integer :follow_count, default: 0
      t.integer :follower_count, default: 0

      t.timestamps
    end
  end
end
