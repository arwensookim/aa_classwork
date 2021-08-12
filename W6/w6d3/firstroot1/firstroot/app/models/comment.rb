# create_table "comments", force: :cascade do |t|
#     t.integer "user_id", null: false
#     t.integer "artwork_id", null: false
#     t.text "body"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["artwork_id"], name: "index_comments_on_artwork_id"
#     t.index ["user_id"], name: "index_comments_on_user_id"
#   end

class Comment < ApplicationRecord
    belongs_to :author,
        foreign_key: :user_id,
        primary_key: :id,
        class_name: :User 

    belongs_to :artwork,
        foreign_key: :artwork_id,
        primary_key: :id,
        class_name: :Artwork 
end
