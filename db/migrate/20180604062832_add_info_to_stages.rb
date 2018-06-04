class AddInfoToStages < ActiveRecord::Migration[5.2]
  def change
    add_column :stages, :city, :string
    add_column :stages, :country, :string
    add_column :stages, :district, :string
    add_column :stages, :address, :string
    add_column :stages, :phone, :string
  end
end
