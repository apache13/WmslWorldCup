class AddWinnerIdToBets < ActiveRecord::Migration[5.1]
  def change
    add_column :bets, :winner_id, :integer
  end
end
