json.extract! shot, :id, :title, :description, :created_at, :updated_at
json.image_url shot.image.url
json.url shot_url(shot, format: :json)
