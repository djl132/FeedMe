# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
name: "Derek",
email: "djl132@case.edu",
password: "helloworld"
)

  User.create!(
  name: "LeeHom",
  email: "leehom@gmail.com",
  password: "helloworld"
  )

    User.create!(
    name: "Ailee",
    email: "ailee@gmail.com",
    password: "helloworld"
    )

    users = User.all

4.times do
  item =  Item.new(title: "hi",
  message:" this is the body", user: users.sample)
  item.save
end
