# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create([{username: 'User1'}, {username: 'User2'},  {username: 'User3'}] )
Artwork.create([{title: 'Art1', image_url: '/null', artist_id: '1'}, {title: 'Art2', image_url: '/null', artist_id: '2'}])
ArtworkShare.create([{artwork_id: 2, viewer_id: 1}, {artwork_id: 2, viewer_id: 3}])


Comment.create({user_id: 1, artwork_id: 1, body: "This is user 1's comment on Art 1"})
Comment.create({user_id: 2, artwork_id: 1, body: "This is user 2's comment on Art 1"})
Comment.create({user_id: 3, artwork_id: 1, body: "This is user 3's comment on Art 1"})

Comment.create({user_id: 1, artwork_id: 2, body: "This is user 1's comment on Art 2"})
Comment.create({user_id: 1, artwork_id: 2, body: "This is user 1's additional comments"})

Like.create({user_id: 1, likeable_type: :Comment, likeable_id:1})
Like.create({user_id: 1, likeable_type: :Artwork, likeable_id:1})