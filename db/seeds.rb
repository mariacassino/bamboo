# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Shop.delete_all
Item.delete_all

maria = User.create!(email: "maria.cassino@gmail.com", password: "myproject", admin: true)
vega = User.create!(email: "jorgevp5@gmail.com", password: "blahblah", admin: false)

marias_shop = maria.shops.create!(name: "Maria's Scented Candles", description: "Delicious Smells!", location: "Raleigh, NC")
vegas_shop = vega.shops.create!(name: "Vega's Box of Wonders", description: "Mysterious Things!", location: "Valhalla")

maria.items.create!(name: "Blueberry Candle", description: "Full of antioxidants for your nose.", shop_id: marias_shop.id, price: 3.99, image: "app/assets/images/blueberry-candle.jpg")
maria.items.create!(name: "Cocoa Candle", description: "Dark chocolate scented.", shop_id: marias_shop.id, price: 4.99)

vega.items.create!(name: "Solid Gold Aardwolf Statue", description: "Magickal talisman.", shop_id: vegas_shop.id, price: 159.99)
vega.items.create!(name: "Ocarina", description: "Lets you travel through time", shop_id: vegas_shop.id, price: 99.99)
