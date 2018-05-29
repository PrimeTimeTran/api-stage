class AddReactionTypeToReaction < ActiveRecord::Migration[5.2]
  def change
    add_column :reactions, :reaction_type, :integer
  end
end
