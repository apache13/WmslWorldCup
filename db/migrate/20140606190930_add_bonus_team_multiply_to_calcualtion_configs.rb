class AddBonusTeamMultiplyToCalcualtionConfigs < ActiveRecord::Migration[5.1]
  def change
    add_column :calculation_configs , :bonus_team_multiply , :integer
  end
end
