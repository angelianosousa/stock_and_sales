class CreateSaleItems < ActiveRecord::Migration[5.2]
  def change
    create_table :sale_items do |t|
      t.references :sale, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :sold_amount, default: 1

      t.timestamps
    end
  end
end
