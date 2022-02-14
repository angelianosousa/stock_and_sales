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
  Category.create!(title: Faker::Company.bs)
end

20.times do
  Product.create!(
    category: Category.all.sample,
    company: Faker::Company.name,
    title: Faker::Lorem.sentence(word_count: 3, random_words_to_add: 4),
    price: rand(100.00..9999.00),
    in_stock: rand(10..50),
    safety_margin: 10
  )
end

50.times do
  products = Product.all.sample(rand(2..5))
  sale = Sale.create!(
    sales_profile: SalesEmployee.all.sample.sales_profile,
    client_name: Faker::Name.name,
    date_sale: Faker::Date.in_date_period(year: 2022)
  )

  sale.sale_items.each do |item|
    item.product = products[item]
  end
end
