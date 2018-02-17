class CreateTasties < ActiveRecord::Migration[5.1]
  def change
    create_table :tasties do |t|
      t.float :level
      t.references :user, foreign_key: true
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
