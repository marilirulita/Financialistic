# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create!(name: "mar", email: "mar@email.com", password: "123456")
user2 = User.create!(name: "jhon", email: "jhon@email.com", password: "123456")

group1 = Group.create!(name: "home", icon: "https://upload.wikimedia.org/wikipedia/commons/9/97/Circle-icons-art.svg", user: user1)
group1 = Group.create!(name: "car", icon: "https://upload.wikimedia.org/wikipedia/commons/9/97/Circle-icons-art.svg", user: user1)

move1 = Move.create!(name: "food", amount: 10.0, author: user1)
move2 = Move.create!(name: "gas", amount: 20.0, author: user2)