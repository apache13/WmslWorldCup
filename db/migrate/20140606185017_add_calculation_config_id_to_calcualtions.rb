class AddCalculationConfigIdToCalcualtions < ActiveRecord::Migration
  def change
    add_column :calculations , :calculation_config_id , :integer
  end
end
