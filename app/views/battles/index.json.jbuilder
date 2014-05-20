json.array!(@battles) do |battle|
  json.extract! battle, :id, :match_id, :player1_id, :player2_id, :player1_point, :player2_point
  json.url battle_url(battle, format: :json)
end
