class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :phone
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
