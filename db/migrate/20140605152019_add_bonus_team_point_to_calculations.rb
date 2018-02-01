class AddBonusTeamPointToCalculations < ActiveRecord::Migration[5.1]
  def change
    add_column :calculations , :bonus_team_point , :integer
  end
end
