# == Schema Information
#
# Table name: stocks
#
#  id             :bigint           not null, primary key
#  move_type      :integer
#  quantity       :integer          default(1)
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("BRL"), not null
#  company_id     :bigint
#  product_id     :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Stock < ApplicationRecord
  enum move_type: %i[shop sell]

  monetize :price_cents

  belongs_to :company
  belongs_to :product
end
