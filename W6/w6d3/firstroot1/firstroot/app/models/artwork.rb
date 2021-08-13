# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, uniqueness: { scope: :artist_id}
    validates :favorite, inclusion: { in: [ true, false ] }

    belongs_to :artist, 
        foreign_key: :artist_id,
        primary_key: :id,
        class_name: :User 

    has_many :shares, 
        foreign_key: :artwork_id,
        primary_key: :id, 
        class_name: :ArtworkShare
    
    has_many :shared_users,
        through: :shares,
        source: :viewer

    has_many :comments,
        foreign_key: :artwork_id,
        primary_key: :id,
        dependent: :destroy,
        class_name: :Comment 

    has_many :likes, as: :likeable 

    
end
