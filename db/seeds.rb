# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

maria = User.create(email: "maria.cassino@gmail.com", password: "password")
vega = User.create(email: "jorgevp5@gmail.com", password: "password")

maria.shops.create!(name: "Maria's Awesome Shop", location: "Raleigh, NC")
vega.shops.create!(name: "Vega's Box of Wonders", location: "Valhalla")


maria.items.create!(name: "Solid Gold Aardwolf Statue", description: "magickal talisman", shop_id: 1)
