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