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
require 'rails_helper'

RSpec.describe Stock, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
