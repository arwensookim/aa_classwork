class Cat < ApplicationRecord
    validates :name, :birth_date, :color, :sex, presence: true 
    # validates :inclusion => { :sex => ["M", "F"] }
    validates :sex, inclusion: %W(M F) 
end
