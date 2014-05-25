class AddCalculationIdToBets < ActiveRecord::Migration
  def change
    add_column :bets , :calculation_id , :integer
  end
end
