class CreateShopCities < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_cities do |t|
      t.string :city

      t.timestamps
    end
  end
end
