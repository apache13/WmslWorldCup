class AddBonusTeamPointToCalculations < ActiveRecord::Migration
  def change
    add_column :calculations , :bonus_team_point , :integer
  end
end
