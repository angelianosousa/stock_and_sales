# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |user|
  SalesEmployee.create!(email:"user#{user}@gmail.com", password: "secret123", password_confirmation: "secret123")
end

10.times do
  Category.create!(title: Faker::Job.field)
end

20.times do
  Product.create!(
    category: Category.all.sample,
    title: Faker::Company.name,
    price_unitary: rand(100.00..9999.00),
    in_stock: rand(10..50),
    safety_margin: 10
  )
end

50.times do
  product = Product.all.sample(rand(2..8))
  random_number = rand(5..12)

  Sale.create!(
    sales_profile: SalesEmployee.all.sample.sales_profile,
    products: product,
    amount: random_number,
    date_sale: Faker::Date.in_date_period
  )
end
