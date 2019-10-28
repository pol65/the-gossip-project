# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
AddGossip.destroy_all
PrivateMessage.destroy_all

cities = []
10.times do
  cities << City.create(
        name: Faker::Games::ElderScrolls.city,
        zip_code: Faker::Address.zip
  )
end

users = []
10.times do
  users << User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Appliance.brand,
        description: Faker::Lorem.paragraphs(number: 1),
        email: Faker::Internet.email,
        age: Faker::Number.between(from: 13, to: 100),
        city: cities.sample
  )
end

tags = []
10.times do
  tags << Tag.create(
        title: Faker::Science.element
  )
end

gossips = []
20.times do
  gossips << Gossip.create(
        title: Faker::Cannabis.buzzword,
        content: Faker::Lorem.paragraphs,
        user: users.sample

  )
  AddGossip.create(
    gossip: gossips.sample, 
    tag: tags.sample
  )
end

messages = []
20.times do
	PrivateMessage.create(
    sender: users.sample,
    recipient: users.sample,
    content: Faker::ChuckNorris.fact
  )
end

puts "C'est prêt !"