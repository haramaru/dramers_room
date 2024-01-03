class CreateRegionGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :region_genres do |t|
      t.string :region, null: false
      t.timestamps
    end
  end
end
