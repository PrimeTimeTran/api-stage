class CreateReactions < ActiveRecord::Migration[5.2]
  def change
    create_table :reactions do |t|
      t.references :user, foreign_key: true
      t.integer :reactionable_id
      t.string :reactionable_type

      t.timestamps
    end
  end
end
