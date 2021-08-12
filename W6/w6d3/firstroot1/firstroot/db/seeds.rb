# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create([{username: 'radio_man'}, {username: 'xX_CsS_GoD_Xx'},  {username: 'squeakycheese'}] )
Artwork.create([{title: 'this art', image_url: '/null', artist_id: '1'}, {title: 'CssGod', image_url: '/null', artist_id: '2'}])
ArtworkShare.create([{artwork_id: 1, viewer_id: 3}, {artwork_id: 2, viewer_id: 1}])