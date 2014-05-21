json.array!(@bets) do |bet|
  json.extract! bet, :id, :match_id, :team1_score, :team2_score
  json.url bet_url(bet, format: :json)
end
