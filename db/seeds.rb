# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'open-uri'
# require 'json'
require 'faker'
require "open-uri"

# url = 'http://tmdb.lewagon.com/movie/top_rated'
# response = JSON.parse(URI.open(url).read)
# response['results'].each do |movie_hash|
# p movie_hash

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

puts "destroying costumes"
Costume.destroy_all
puts "creating costumes"
# 4.times do
  costume = Costume.create!(
    name: "Pikachu Cosplay",
    size: ["S", "M", "L"].sample,
    price: rand(1000..10_000),
    user_id: User.ids.sample,
  )
  file = URI.open('https://cdn.shopify.com/s/files/1/1282/4381/products/product-image_13ff26c5-5711-49d3-af2a-2a7e041d8ac8_1024x1024.jpg?v=1463839538')
  costume.photo.attach(io: file, filename: 'costume.png', content_type: 'image/png')

  costume = Costume.create!(
    name: "Zelda Cosplay",
    size: ["S", "M", "L"].sample,
    price: rand(1000..10_000),
    user_id: User.ids.sample,
  )
  file = URI.open('https://media.istockphoto.com/photos/princess-zelda-cosplay-picture-id855474834')
  costume.photo.attach(io: file, filename: 'costume.png', content_type: 'image/png')
  costume = Costume.create!(
    name: "Goku Cosplay",
    size: ["S", "M", "L"].sample,
    price: rand(1000..10_000),
    user_id: User.ids.sample,
  )
  file = URI.open('https://i.pinimg.com/originals/1a/6f/38/1a6f384cde2b5a40234de474e935c12e.jpg')
  costume.photo.attach(io: file, filename: 'costume.png', content_type: 'image/png')
  costume = Costume.create!(
    name: "Ichigo Cosplay",
    size: ["S", "M", "L"].sample,
    price: rand(1000..10_000),
    user_id: User.ids.sample,
  )
  file = URI.open('https://cdn.worldcosplay.net/724719/rxnwcmofejiqkmxkkzaupgcnzrcosjgrdxsirfkd-740.jpg')
  costume.photo.attach(io: file, filename: 'costume.png', content_type: 'image/png')
  costume = Costume.create!(
    name: "Kimetsu Cosplay",
    size: ["S", "M", "L"].sample,
    price: rand(1000..10_000),
    user_id: User.ids.sample,
  )
  file = URI.open('https://cdn.worldcosplay.net/293284/orwphsnofmqehzqhmzqmvvpqwjsimtplodevsmdz-740.jpg')
  costume.photo.attach(io: file, filename: 'costume.png', content_type: 'image/png')
  costume = Costume.create!(
    name: "Cell Cosplay",
    size: ["S", "M", "L"].sample,
    price: rand(1000..10_000),
    user_id: User.ids.sample,
  )
  file = URI.open('https://64.media.tumblr.com/37e42870545e8b71d02cb5f1c1c9cbf2/tumblr_opdw9dMRy51upiu8jo1_1280.jpg')
  costume.photo.attach(io: file, filename: 'costume.png', content_type: 'image/png')
  costume = Costume.create!(
    name: "Attack on Titan - Bread",
    size: ["S", "M", "L"].sample,
    price: rand(1000..10_000),
    user_id: User.ids.sample,
  )
  file = URI.open('https://static0.cbrimages.com/wordpress/wp-content/uploads/2019/10/Sasha-Braus-Attack-on-Titan-Cosplay.jpg?q=50&fit=crop&w=740&h=489&dpr=1.5')
  costume.photo.attach(io: file, filename: 'costume.png', content_type: 'image/png')
  costume = Costume.create!(
    name: "Spider-man cosplay",
    size: ["S", "M", "L"].sample,
    price: rand(1000..10_000),
    user_id: User.ids.sample,
  )
  file = URI.open('https://i.etsystatic.com/19750816/r/il/95ae9e/3305956735/il_fullxfull.3305956735_b5yu.jpg')
  costume.photo.attach(io: file, filename: 'costume.png', content_type: 'image/png')
  costume = Costume.create!(
    name: "Thor cosplay",
    size: ["S", "M", "L"].sample,
    price: rand(1000..10_000),
    user_id: User.ids.sample,
  )
  file = URI.open('https://cdn.costumewall.com/wp-content/uploads/2015/10/thor.jpg')
  costume.photo.attach(io: file, filename: 'costume.png', content_type: 'image/png')
  costume = Costume.create!(
    name: "Wolverine",
    size: ["S", "M", "L"].sample,
    price: rand(1000..10_000),
    user_id: User.ids.sample,
  )
    file = URI.open('https://i.kym-cdn.com/photos/images/original/001/419/425/b5a.jpg')
  costume.photo.attach(io: file, filename: 'costume.png', content_type: 'image/png')
  puts "created costumes"
# end


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
