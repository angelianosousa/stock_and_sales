class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.references :sales_profile, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :amount
      t.decimal :amount_price
      t.datetime :date_sale

      t.timestamps
    end
  end
end
