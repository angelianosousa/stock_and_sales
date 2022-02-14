class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true
      t.integer :product_code, null: false
      t.string :company
      t.string :model
      t.string :title
      t.decimal :price, default: 0
      t.integer :in_stock, default: 0
      t.integer :safety_margin, default: 0

      t.timestamps
    end
  end
end
