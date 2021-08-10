class Visit < ApplicationRecord
    belongs_to :user,
        primary_key: :id,
        foreign_key: :submitter_id,
        class_name: :User 


    belongs_to  :shortened_url,
        primary_key: :id, 
        foreign_key: :shortened_url_id,
        class_name: :ShortenedUrl

    def self.record_visit!(shortened_url, user)
        Visit.create!(shortened_url_id: shortened_url.id, submitter_id: user.id)
    end
end
