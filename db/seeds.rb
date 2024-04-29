# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |user|
  SalesEmployee.create!(email:"user#{user}@teste.com", password: "user321", password_confirmation: "user321")
end

10.times do
  Category.create!(title: Faker::ProgrammingLanguage.name)
end

20.times do
  Product.create!(
    category: Category.all.sample,
    company: Faker::Restaurant.type,
    title: Faker::Restaurant.name,
    price_cents: rand(100.00..9999.00),
    in_stock: 50,
    safety_margin: 10
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
