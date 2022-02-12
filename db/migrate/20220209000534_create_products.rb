class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true
      t.references :sale, foreign_key: true
      t.integer :product_code, null: false
      t.string :title
      t.decimal :price_unitary
      t.integer :in_stock
      t.integer :safety_margin

      t.timestamps
    end
  end
end
