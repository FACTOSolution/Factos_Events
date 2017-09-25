json.id @user.id
json.provider @user.provider
json.uid @user.uid
json.name @user.name
json.nickname @user.nickname
json.image @user.image
json.email @user.email
json.events do
  json.array! @user.events.collect { |e| e.id }
end
