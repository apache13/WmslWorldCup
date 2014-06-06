class AddCalculationConfigIdToBets < ActiveRecord::Migration
  def change
    add_column :bets , :calculation_config_id , :integer
  end
end
