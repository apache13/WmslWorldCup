class RemoveWinnerIdFromBets < ActiveRecord::Migration[5.1]
  def change
    remove_column :bets, :winner_id
  end
end
