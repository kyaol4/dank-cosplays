# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
# Users
User.destroy_all
puts "Creating all the users......"
User.create!(
  email: "tobymanley1990@gmail.com",
  password: "password",
  name: "Toby",
  address: "Tokyo"
)
User.create!(
  email: "saorimita4@gmail.com",
  password: "password",
  name: "Saori",
  address: "Tokyo"
)
User.create!(
  email: "r.winstonc@gmail.com",
  password: "password",
  name: "Winston",
  address: "Tokyo"
)
User.create!(
  email: "kyaol4@gmail.com",
  password: "password",
  name: "Dongwook",
  address: "Tokyo"
)

Costume.destroy_all
4.times do
  Costume.create!(
    name: Faker::Games::Pokemon.name,
    size: ["S", "M", "L"].sample,
    price: rand(1000..10_000),
    user_id: User.ids.sample
  )
end


# Bookings
Booking.destroy_all
4.times do
  Booking.create!(
    start_date: Date.today - rand(1..10),
    end_date: Date.today + rand(1..10),
    status: Booking.statuses.keys.sample,
    user_id: User.ids.sample,
    costume_id: Costume.ids.sample
  )
end
