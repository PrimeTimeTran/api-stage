class AddUploadS3KeyToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :upload_s3_location, :text
  end
end
