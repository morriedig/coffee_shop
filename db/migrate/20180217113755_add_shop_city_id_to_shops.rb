class AddShopCityIdToShops < ActiveRecord::Migration[5.1]
  def change
    add_reference :shops, :shop_city, foreign_key: true
  end
end
