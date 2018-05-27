# frozen_string_literal: true

class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_id
      t.string :user

      t.timestamps
    end
    add_index :friendships, :user
  end
end
