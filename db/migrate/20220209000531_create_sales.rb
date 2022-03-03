class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.references :sales_profile, foreign_key: true
      t.string :client_name, null: false
      t.date :date_sale, default: Date.today
      t.decimal :total_price, default: 0
      t.boolean :picked_up, default: false

      t.timestamps
    end
  end
end
