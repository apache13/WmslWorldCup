json.array!(@calculations) do |calculation|
  json.extract! calculation, :id, :player_id, :bet_id, :total_point, :team_winner_point, :score_point
  json.url calculation_url(calculation, format: :json)
end
