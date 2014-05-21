json.array!(@jakkrits) do |jakkrit|
  json.extract! jakkrit, :id, :name, :age
  json.url jakkrit_url(jakkrit, format: :json)
end
