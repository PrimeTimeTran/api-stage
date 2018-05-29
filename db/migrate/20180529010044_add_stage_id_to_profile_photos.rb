class AddStageIdToProfilePhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :profile_photos, :stage_id, :integer
  end
end
