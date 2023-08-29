# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Friendship.destroy_all
User.destroy_all

user_1 = User.create!(email: 'test_1@com.ua', password: '123456')
user_2 = User.create!(email: 'test_2@com.ua', password: '234567')

user_1.create_profile!(location: 'Kyiv, Ukraine', bio: 'Software engineer', full_name: 'Bygio Julio')
user_2.create_profile!(location: 'Berlin, Germany', bio: 'Civil engineer', full_name: 'Andreas Muller')

post_1 = user_1.posts.create!(content: 'Post content 1!')
post_2 = user_2.posts.create!(content: 'Post content 2!')

comment_2 = post_1.comments.create!(user: user_2, message: 'Comment message 2')
comment_1 = post_2.comments.create!(user: user_1, message: 'Comment message 1')

friendships_1 = user_1.friendships.create!(friend: user_2)
friendships_2 = user_2.friendships.create!(friend: user_1)

user_1.notifications.create!(notifiable: friendships_1)
user_2.notifications.create!(notifiable: friendships_2)

user_1.likes.create!(likeable: post_2)
user_1.likes.create!(likeable: comment_2)

user_2.likes.create!(likeable: post_1)
user_2.likes.create!(likeable: comment_1)
