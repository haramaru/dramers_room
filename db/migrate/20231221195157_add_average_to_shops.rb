class AddAverageToShops < ActiveRecord::Migration[6.1]
  def change
    add_column :shops, :average, :float
  end
end
