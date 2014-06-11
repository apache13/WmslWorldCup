class AddOwnGoalPointAndYellowCardPointAndRedCardPointAndPenaltyPointToCalculations < ActiveRecord::Migration
  def change
    add_column :calculations , :own_goal_point , :integer
    add_column :calculations , :yellow_card_point, :integer
    add_column :calculations , :red_card_point , :integer
    add_column :calculations , :penalty_point , :integer
  end
end
