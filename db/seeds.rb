User.delete_all
Friendship.delete_all
Post.delete_all
Comment.delete_all
Like.delete_all

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

100.times do |n|
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password"
    )
  user.save
end

# Posts
users = User.order(:created_at)
10.times do 
  users.each do |user|
    body = Faker::Hipster.sentence
    user.posts.create!(body: body)
  end
end

# Friendships
users = User.all
pending = users[0..30]
requested = users[31..60]
accepted = users[31..45]
final_requested = users[61..90]

pending.each do |n|
  requested.each do |i|
    Friendship.request(n, i)
  end
end

accepted.each do |n|
  pending.each do |i|
    Friendship.accept(n, i)
  end
end

final_requested.each do |n|
  pending.each do |i|
    Friendship.request(n, i)
  end
end

#Likes and comments
users.each do |user|
  posts = Post.where(user: user.friends).order("RANDOM()").take(6)
  posts.each do |post|
    comment = Faker::StarWars.quote
    post.likes.create!(user_id: user.id)
    post.comments.create!(user_id: user.id, post_id: post.id, comment: comment)
  end
end





