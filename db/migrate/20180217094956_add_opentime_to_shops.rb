class AddOpentimeToShops < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :open_time, :string
  end
end
