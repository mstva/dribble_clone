json.extract! @user
json.user_id @user.id
json.name @user.name
json.username @user.username
json.email @user.email
json.shots @user.shots do |shot|
  json.shot_id shot.id
  json.title shot.title
  json.description shot.description
  json.image_url shot.image.url
  json.created_at shot.created_at
  json.updated_at shot.updated_at
  json.shot_url shot_url(shot, format: :json)
end
