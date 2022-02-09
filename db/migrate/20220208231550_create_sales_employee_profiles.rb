class CreateSalesEmployeeProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_employee_profiles do |t|
      t.string :name
      t.references :sales_employee, foreign_key: true

      t.timestamps
    end
  end
end
