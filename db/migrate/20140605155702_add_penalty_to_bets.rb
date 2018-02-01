class AddPenaltyToBets < ActiveRecord::Migration[5.1]
  def change
    add_column :bets , :penalty , :boolean
  end
end
