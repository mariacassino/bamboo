# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Shop.create(name: "Maria's Awesome Shop", location: "Raleigh, NC")
Shop.create(name: "Vega's Box of Wonders", location: "Valhalla")

User.create(email: "maria.cassino@gmail.com", password: "password")

Item.create(name: "Solid Gold Aardwolf Statue", description: "magickal talisman", shop_id: 1)
