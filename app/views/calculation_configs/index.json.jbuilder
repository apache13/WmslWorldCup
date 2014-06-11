json.array!(@calculation_configs) do |calculation_config|
  json.extract! calculation_config, :id, :team_winner_multiply, :score_multiply, :penalty_multiply, :yellow_card_multiply, :red_card_multiply, :own_goal_multiply
  json.url calculation_config_url(calculation_config, format: :json)
end
