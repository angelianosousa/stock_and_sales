class AddCountProductToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :products_count, :integer, default: 0
    add_column :categories, :sales_count, :integer, default: 0
  end
end
