# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

person1 = Person.create(name: "Stefanie", house_id: 1)
person2 = Person.create(name: "BobTheDragQueen", house_id: 2)
person3 = Person.create(name: "Dude", house_id: 3)

house1 = House.create(address: "123 Main St.")
house2 = House.create(address: "2 McStreetName St")
house3 = House.create(address: "345 Beach Lane")
