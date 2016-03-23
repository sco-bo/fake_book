password = "password"

50.times do |n|
  user = User.new(
    email: Faker::Internet.email,
    password: "password"
    )
  user.save
end