class RemoveCalculationConfigIdFromCalculations < ActiveRecord::Migration[5.1]
  def change
    remove_column :calculations , :calculation_config_id
  end
end
