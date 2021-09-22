json.extract! @party, :name

json.guests @party.guests
json.array! @party.guests do |guest|
    json.gifts guest.gifts
end 
