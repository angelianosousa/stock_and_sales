# == Schema Information
#
# Table name: sale_items
#
#  id                      :bigint           not null, primary key
#  sale_id                 :bigint
#  product_id              :bigint
#  sold_amount             :integer          default(1), not null
#  subtotal_price_cents    :integer          default(0), not null
#  subtotal_price_currency :string           default("BRL"), not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
class SaleItem < ApplicationRecord
  belongs_to :sale
  belongs_to :product

  monetize :subtotal_price_cents

  before_save :sale_amount_is_higher_than_product_stocks?
  
  # TODO | Rever lógica de estorno de produtos
  def return_product!
    product.in_stock += sold_amount
    product.save!
  end

  def sale_amount_is_higher_than_product_stocks?
    remaining_products = (product.current_stock - sold_amount)

    if remaining_products <= 0
      errors.add :sold_amount, :invalid, message: "O estoque do produto #{product.name} não pode ficar negativo!!"
    end
  end
end
