class CreateProduct < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.string :sku, null: false
      t.integer :price, null: false, default: 0
      t.timestamps null: false
    end
  end
end
