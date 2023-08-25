# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# require 'faker'
Offer.destroy_all
Car.destroy_all
User.destroy_all

user = User.find_or_create_by(email: 'wheelzdealz@example.com') do |user|
  user.password = '00000000'
  user.password_confirmation = '00000000'
  user.name = 'admin'
end

test_buyer = User.find_or_create_by(email: 'buyer@example.com') do |user|
  user.password = '00000000'
  user.password_confirmation = '00000000'
  user.name = 'test buyer'
end

5.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'password123',
    password_confirmation: 'password123',
    name: Faker::Name.name,
  )
end

user = User.find_by(email: 'wheelzdealz@example.com')

20.times do
  user.cars.create!(
    car_model: Faker::Vehicle.make_and_model,
    car_info: Faker::Vehicle.standard_specs.join(". "),
    car_price: rand(1_000_000..10_000_000),
    offer_status: false
  )
end

selected_cars = Car.all.sample(5)

selected_cars.each do |car|
  buyer = (User.all - [car.seller]).sample
  Offer.create!(
    car: car,
    buyer: buyer
  )
end
