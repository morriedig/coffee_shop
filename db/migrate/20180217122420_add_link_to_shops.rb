class AddLinkToShops < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :link, :string
    add_column :shops, :wifi, :float
    add_column :shops, :limited_time, :string
  end
end
