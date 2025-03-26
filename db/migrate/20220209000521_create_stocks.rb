class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.integer :move_type
      t.integer :quantity, default: 1
      t.monetize :price, default: 1
      t.references :company, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
