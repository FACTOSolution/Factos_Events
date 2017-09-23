json.pagination do
  json.next_link @events.next_page
end
json.events @events do |event|
    json.event_id event.id
    json.name event.name
    json.description event.description
    json.value event.value
    json.address event.address
    json.contact event.contact
    json.type event.type
    json.date event.date
    json.images event.images
    json.user event.user.id
    json.published event.published
    json.lat event.lat
    json.long event.long
end
