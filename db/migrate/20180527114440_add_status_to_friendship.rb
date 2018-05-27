# frozen_string_literal: true

class AddStatusToFriendship < ActiveRecord::Migration[5.2]
  def change
    add_column :friendships, :status, :string
  end
end
