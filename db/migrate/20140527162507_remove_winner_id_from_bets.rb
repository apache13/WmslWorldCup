class RemoveWinnerIdFromBets < ActiveRecord::Migration
  def change
    remove_column :bets, :winner_id
  end
end
