class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.references :sales_profile, foreign_key: true
      t.string :client_name, null: false
      t.datetime :saled_at
      t.monetize :total_price, default: 0, null: false
      t.integer :status, default: 0
      t.integer :payment_method, default: 0

      t.timestamps
    end
  end
end
