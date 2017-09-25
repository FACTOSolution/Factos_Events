json.array! @events do |event|
    json.event_id event.id
    json.name event.name
    json.description event.description
    json.value event.value
    json.address event.address
    json.contact event.contact
    json.type event.type
    json.date event.date
    json.images do
      json.array! event.images.collect { |img| img.image_url }
    end
    json.status event.event_status
    json.user event.user.id
    json.published event.published
    json.lat event.lat
    json.long event.long
end
