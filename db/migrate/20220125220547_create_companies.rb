class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :cpf_cnpj
      t.integer :person_type

      t.timestamps
    end
  end
end
