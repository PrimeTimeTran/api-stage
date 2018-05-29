class RemoveTypeFromReaction < ActiveRecord::Migration[5.2]
  def change
    remove_column :reactions, :type, :string
  end
end
