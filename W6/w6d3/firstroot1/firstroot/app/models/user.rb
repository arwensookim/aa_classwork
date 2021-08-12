# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
   
    has_many :artworks, 
        foreign_key: :artist_id,
        primary_key: :id,
        dependent: :destroy,
        class_name: :Artwork 

    has_many :shares,
        foreign_key: :viewer_id,
        primary_key: :id,
        dependent: :destroy,
        class_name: :ArtworkShare 

    has_many :shared_artworks, 
        through: :shares,
        source: :artwork

    has_many :comments, 
        foreign_key: :user_id,
        primary_key: :id,
        dependent: :destroy,
        class_name: :Comment 

end
