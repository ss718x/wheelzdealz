# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
20.times do
  cars = cars.new(
    car_model: Faker::Vehicle.make_and_model,
    car_info: Faker::Vehicle.standard_specs,
    car_price: rand(1_000_000..10_000_000),
    offer_status: false
  )
end
