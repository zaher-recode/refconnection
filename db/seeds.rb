# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

# Seed the Categories
Category.create([
    {name: "Maintenance Services"},
    {name: "Teaching Services"},
    {name: "Freelance Services"}
    ])

Industry.create([
    {name: "Accounting"},
    {name: "Aeorspace"},
    {name: "Agriculture"},
    {name: "Computer"},
    {name: "Construction"},
    {name: "Education"},
    {name: "Electronics"},
    {name: "Energy"},
    {name: "Entertainment"},
    {name: "Food"},
    {name: "Healthcare"},
    {name: "Hospitality"},
    {name: "Manufacturing"},
    {name: "Music"},
    {name: "Mining"},
    {name: "News Media"},
    {name: "Pharmaceutical"},
    {name: "Telecommunication"},
    {name: "Transport"},
    {name: "Worldwide Web"}
    ])
    
    password = '123123'
1.upto(5) do |i|
  User.create(
    username: "user-#{i}",
    email: "user-#{i}@example.com",
    password: password,
    password_confirmation: password
  )
end
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
