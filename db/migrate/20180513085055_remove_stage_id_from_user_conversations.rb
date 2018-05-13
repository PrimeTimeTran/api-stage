class RemoveStageIdFromUserConversations < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_conversations, :stage_id, :integer
  end
end
