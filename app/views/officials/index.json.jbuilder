json.array!(@officials) do |official|
  json.extract! official, :id
  json.url official_url(official, format: :json)
end
