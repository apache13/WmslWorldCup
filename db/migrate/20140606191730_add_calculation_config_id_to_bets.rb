class AddCalculationConfigIdToBets < ActiveRecord::Migration[5.1]
  def change
    add_column :bets , :calculation_config_id , :integer
  end
end
