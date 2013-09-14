json.array!(@suggestions) do |suggestion|
  json.extract! suggestion, :name, :description, :submitter
  json.url suggestion_url(suggestion, format: :json)
end
