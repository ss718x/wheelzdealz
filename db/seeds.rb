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
    model: Faker::Vehicle.make_and_model,
    info: Faker::Vehicle.standard_specs,
    price: rand(1000000..10000000),
    offer_status: false
  )
end
