# frozen_string_literal: true

class AddStageIdToConversations < ActiveRecord::Migration[5.2]
  def change
    add_column :conversations, :stage_id, :integer
  end
end
