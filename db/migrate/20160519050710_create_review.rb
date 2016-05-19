class CreateReview < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :product
      t.string :review, null: false
      t.integer :rating, null: false, default: 0
      t.timestamps null: false
    end
  end
end
