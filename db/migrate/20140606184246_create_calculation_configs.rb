class CreateCalculationConfigs < ActiveRecord::Migration
  def change
    create_table :calculation_configs do |t|
      t.integer :team_winner_multiply
      t.integer :score_multiply
      t.integer :penalty_multiply
      t.integer :yellow_card_multiply
      t.integer :red_card_multiply
      t.integer :own_goal_multiply

      t.timestamps
    end
  end
end
