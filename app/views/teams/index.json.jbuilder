json.array!(@teams) do |team|
  json.extract! team, :id, :name, :abbreviate
  json.url team_url(team, format: :json)
end
