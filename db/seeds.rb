# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Vendor.delete_all
Listing.delete_all
Buyer.delete_all
Offer.delete_all


fred = Vendor.create(name: "Fred")
bob = Vendor.create(name: "Bob")

fred.listings.create(species: "European Honey Bee", quantity: 10)

lucy = Buyer.create(name: "Lucy")
elliot = Buyer.create(name: "Elliot")
tim = Buyer.create(name: "Tim")