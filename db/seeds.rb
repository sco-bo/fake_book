User.delete_all
Friendship.delete_all

User.create!(
  name: "Scott",
  email: "scott@gmail.com",
  password: "password"
  )

User.create!(
  name: "Dave",
  email: "dave@gmail.com",
  password: "password"
  )

User.create!(
  name: "Zach",
  email: "Zach@gmail.com",
  password: "password"
  )

50.times do |n|
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password"
    )
  user.save
end