class CreateVirtualGifts < ActiveRecord::Migration[5.2]
  def change
    create_table :virtual_gifts do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :giftable_type
      t.integer :giftable_id

      t.timestamps
    end
  end
end
