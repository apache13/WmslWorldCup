class AddCalculationConfigIdToCalcualtions < ActiveRecord::Migration[5.1]
  def change
    add_column :calculations , :calculation_config_id , :integer
  end
end
