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
require 'rails_helper'

RSpec.describe SaleItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
