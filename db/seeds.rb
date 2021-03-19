# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Review.destroy_all

50.times do |index|
  product = Product.create!(name: Faker::Beer.unique.name, brand: Faker::Beer.brand, country_of_origin: Faker::Address.country, cost: Faker::Commerce.price(range: 0..100.0))
  5.times do |index|
    Review.create!(author: Faker::FunnyName.two_word_name, content_body: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false), rating: Faker::Number.between(from: 1, to: 5), product_id: product.id)
  end
end
