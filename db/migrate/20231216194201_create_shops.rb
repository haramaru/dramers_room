class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :shop_name, null: false
      t.string :telephone_number, null: false
      t.string :address, null: false
      t.integer :region_genre_id, null: false, default: 1

      t.timestamps
    end
  end
end
