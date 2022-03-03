require 'rails_helper'

RSpec.describe "Modulo de #{Sale.model_name.human.pluralize}:", type: :model do
  context 'CRUD Vendas' do
    it 'Registrando uma venda' do
      @sale = Sale.create(
        sales_profile: SalesProfile.all.sample,
        products: Product.all.sample(rand(2..5)),
        amount: rand(5..12),
        date_sale: Faker::Date.in_date_period
      )
      expect(@sale).to be_valid
    end
  end
end
