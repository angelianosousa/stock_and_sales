class CreateSalesProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_profiles do |t|
      t.references :sales_employee, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
