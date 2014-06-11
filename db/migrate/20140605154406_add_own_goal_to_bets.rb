class AddOwnGoalToBets < ActiveRecord::Migration
  def change
    add_column :bets , :own_goal , :boolean
  end
end
