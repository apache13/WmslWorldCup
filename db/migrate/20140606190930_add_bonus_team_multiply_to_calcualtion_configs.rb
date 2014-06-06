class AddBonusTeamMultiplyToCalcualtionConfigs < ActiveRecord::Migration
  def change
    add_column :calculation_configs , :bonus_team_multiply , :integer
  end
end
