class RemoveAverageFromShops < ActiveRecord::Migration[6.1]
  def change
    remove_column :shops, :average, :float
  end
end
