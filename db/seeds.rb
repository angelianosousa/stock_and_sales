# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |user|
  SalesEmployee.create(email:"user#{user}@gmail.com", password: "secret123", password_confirmation: "secret123")
end

10.times do |category|
  Category.create(title: Faker::Ancient.titan)
end

20.times do |product|
  Product.create(
    category: Category.all.sample,
    title: Faker::Beer.name,
    price_unitary: rand(100.00..9999.00),
    in_stock: rand(10..50),
    safety_margin: 10
  )
end

50.times do |sales|
  @product = Product.all.sample
  random_number = rand(5..12)

  Sale.create(
    sales_employee: SalesEmployee.all.sample,
    product: @product,
    amount: random_number,
    amount_price: random_number*@product.price_unitary,
    date_sale: "22-#{rand(1..12)}-#{rand(1..31)}".to_date
  )
end
