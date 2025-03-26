# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

current_company = Company.find_or_initialize_by(name: 'Empresa XPTO') do |company|
  company.person_type = Company.person_types[:cnpj]
  company.cpf_cnpj    = CNPJ.generate
  company.save!
end

current_company.sales_employees.find_or_initialize_by(email:"user@teste.com") do |user|
  user.password              = "user321"
  user.password_confirmation = "user321"
  user.save!
end

10.times do
  current_company.categories.find_or_create_by!(name: Faker::ProgrammingLanguage.name)
end

20.times do
  current_company.products.find_or_create_by!(
    category: current_company.categories.sample,
    company: Faker::Restaurant.type,
    name: Faker::Restaurant.name,
    price_cents: rand(100.00..9999.00),
    safety_margin: 10
  )
end

current_company.products.each do |prd|
  current_company.stocks.create!(
    product_id: prd.id,
    move_type: Stock.move_types[:shop],
    price_cents: 100,
    quantity: 50,
  )
end

# 20.times do
#   sale = Sale.find_or_initialize_by(
#     sales_profile: SalesEmployee.all.sample.sales_profile,
#     client_name:   Faker::Name.name,
#     saled_at:      Faker::Date.in_date_period(year: 2024)
#   )

#   product = Product.all.sample

#   sold_amount = rand(1..3)
#   sale.sale_items.build(product: product, sold_amount: sold_amount)
#   sale.total_price_cents += product.price_cents*sold_amount

#   sale.save
# end
