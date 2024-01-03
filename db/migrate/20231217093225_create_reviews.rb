class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
      t.integer :shop_id, null: false
      t.text :review, null: false
      t.float :rate, null: false, default: 0

      t.timestamps
    end
  end
end
