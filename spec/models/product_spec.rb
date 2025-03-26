# == Schema Information
#
# Table name: products
#
#  id             :bigint           not null, primary key
#  company_id     :bigint
#  category_id    :bigint
#  product_code   :string           not null
#  company        :string
#  name           :string
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("BRL"), not null
#  safety_margin  :integer          default(1)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'rails_helper'

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
