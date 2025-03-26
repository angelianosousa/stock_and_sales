# == Schema Information
#
# Table name: sales
#
#  id                   :bigint           not null, primary key
#  company_id           :bigint
#  sales_employee_id    :bigint
#  client_name          :string           not null
#  saled_at             :datetime
#  total_price_cents    :integer          default(0), not null
#  total_price_currency :string           default("BRL"), not null
#  status               :integer          default("open")
#  payment_method       :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
require 'rails_helper'

RSpec.describe "Modulo de #{Sale.model_name.human.pluralize}:", type: :model do
  context 'CRUD Vendas' do
    it 'Registrando uma venda' do
      @sale = Sale.create(
        sales_profile: SalesProfile.all.sample,
        products: Product.all.sample(rand(2..5)),
        amount: rand(5..12),
        saled_at: Faker::Date.in_date_period
      )
      expect(@sale).to be_valid
    end
  end
end
