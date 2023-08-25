# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# require 'faker'

# Destroy existing records
Offer.destroy_all
Car.destroy_all
User.destroy_all

# Create admin user
user = User.find_or_create_by(email: 'wheelzdealz@example.com') do |user|
  user.password = '00000000'
  user.password_confirmation = '00000000'
  user.name = 'admin'
end

# Create test user
User.find_or_create_by(email: 'user@test.com') do |user|
  user.password = '00000000'
  user.password_confirmation = '00000000'
  user.name = 'Testo'
end

# Create other users
5.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'password123',
    password_confirmation: 'password123',
    name: Faker::Name.name,
  )
end

# Create cars for the admin user
user = User.find_by(email: 'wheelzdealz@example.com')

12.times do
  user.cars.create!(
    car_model: Faker::Vehicle.make_and_model,
    car_info: Faker::Vehicle.standard_specs.join(". "),
    car_price: rand(1_000_000..10_000_000),
    offer_status: false
  )
end

# Create offers for selected cars
selected_cars = user.cars.sample(3)

selected_cars.each do |car|
  buyer = (User.all - [car.seller]).sample
  Offer.create!(
    car: car,
    buyer: buyer
  )
end
