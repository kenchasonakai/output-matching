# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
test = User.create(name: 'test', email: 'test@example.com', password: 'pass', password_confirmation: 'pass')
test1 = User.create(name: 'test1', email: 'test1@example.com', password: 'pass', password_confirmation: 'pass')
test2 = User.create(name: 'test2', email: 'test2@example.com', password: 'pass', password_confirmation: 'pass')
