class AddPenaltyToBets < ActiveRecord::Migration
  def change
    add_column :bets , :penalty , :boolean
  end
end
