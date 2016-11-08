# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(first_name: 'Tony', last_name: 'Stark', role: 'renter', address: '420 down under', email: 'tony@stark.com')
u2 = User.create(first_name: 'Carla', last_name: 'Carla', role: 'renter', address: '420 Amsterdam', email: 'carla@carla.com')
u3 = User.create(first_name: 'Chicken', last_name: 'Man', role: 'owner', address: '420 Under down', email: 'chicken@man.com')

b1 = Board.create(description: 'long', price: '420', category: 'Longboard', user: u3)
b2 = Board.create(description: 'penny', price: '42.0', category: 'Pennyboard', user: u3)

r1 = Review.create(content: 'this board was long.', user: u1, board: b1)
