class AddCalculationIdToBets < ActiveRecord::Migration[5.1]
  def change
    add_column :bets , :calculation_id , :integer
  end
end
