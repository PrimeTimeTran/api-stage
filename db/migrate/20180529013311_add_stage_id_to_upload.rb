class AddStageIdToUpload < ActiveRecord::Migration[5.2]
  def change
    add_column :uploads, :stage_id, :integer
  end
end
