class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true
      t.string :title
      t.decimal :price_monetary
      t.integer :in_stock
      t.integer :safety_margin

      t.timestamps
    end
  end
end
