class CreateUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :uploads do |t|
      t.integer :uploadable_id
      t.string :uploadable_type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
