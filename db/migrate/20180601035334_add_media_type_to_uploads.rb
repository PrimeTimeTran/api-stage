class AddMediaTypeToUploads < ActiveRecord::Migration[5.2]
  def change
    add_column :uploads, :media_type, :string
  end
end
