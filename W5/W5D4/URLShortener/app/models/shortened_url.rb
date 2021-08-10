class ShortenedUrl < ApplicationRecord
    validates :long_url, presence: true
    validates :short_url, presence: true, uniqueness: true

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :shortener_id,
        class_name: :User

    has_many :visitors,
        primary_key: :id,
        foreign_key: :shortened_url_id,
        class_name: :Visit

    def self.create_url(user_obj, long_url)
        ShortenedUrl.create!(shortener_id: user_obj.id, long_url: long_url, short_url: self.random_code)
    end

    def self.random_code
        temp_short_url = nil
        while ShortenedUrl.exists?(short_url: temp_short_url) || temp_short_url.nil?
            temp_short_url = SecureRandom.urlsafe_base64
        end
        temp_short_url
    end

    def num_clicks
        visitors.count
    end
    
    def num_uniques
        visitors.select(:submitter_id).distinct.count
    end

    # def recent_uniques
    #     Visit.all.where("created_at < #{10.minutes.ago}").count
    # end

end
