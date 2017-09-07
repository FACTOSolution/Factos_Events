json.id @user.id
json.provider @user.provider
json.uid @user.uid
json.name @user.name
json.nickname @user.nickname
json.image @user.image
json.email @user.email
json.events @user.events do |event|
  json.event_id event.id
end
