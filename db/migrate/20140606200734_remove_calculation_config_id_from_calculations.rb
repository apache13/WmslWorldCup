class RemoveCalculationConfigIdFromCalculations < ActiveRecord::Migration
  def change
    remove_column :calculations , :calculation_config_id
  end
end
