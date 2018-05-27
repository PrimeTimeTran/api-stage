# frozen_string_literal: true

class AddStageIdToUserConversations < ActiveRecord::Migration[5.2]
  def change
    add_column :user_conversations, :stage_id, :integer
  end
end
