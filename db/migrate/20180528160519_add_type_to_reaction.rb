class AddTypeToReaction < ActiveRecord::Migration[5.2]
  def change
    add_column :reactions, :type, :integer
  end
end
