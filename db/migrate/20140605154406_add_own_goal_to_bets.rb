class AddOwnGoalToBets < ActiveRecord::Migration[5.1]
  def change
    add_column :bets , :own_goal , :boolean
  end
end
