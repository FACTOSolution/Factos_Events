json.array! @events do |event|
    json.name event.name
    json.description event.description
    json.value_in_real event.value_in_real
    json.address event.address
    json.contact event.contact
    json.type event.type
    json.date event.date
    json.user_id event.user.id
end
