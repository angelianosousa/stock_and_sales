class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :company, foreign_key: true
      t.references :category, foreign_key: true
      t.string :product_code, null: false
      t.string :company
      t.string :name
      t.monetize :price, default: 1, null: false
      t.integer :safety_margin, default: 1

      t.timestamps
    end
  end
end
