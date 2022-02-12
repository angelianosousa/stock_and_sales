class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.references :sales_profile, foreign_key: true
      t.string :sales_code, null: false
      t.integer :amount
      t.datetime :date_sale

      t.timestamps
    end
  end
end
