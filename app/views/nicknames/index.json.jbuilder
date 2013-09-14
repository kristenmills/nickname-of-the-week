json.array!(@nicknames) do |nickname|
  json.extract! nickname, :name, :comment, :rating, :week_id
  json.url nickname_url(nickname, format: :json)
end
