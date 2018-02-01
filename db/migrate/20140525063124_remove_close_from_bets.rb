class RemoveCloseFromBets < ActiveRecord::Migration[5.1]
  def change
    remove_column :bets, :close
  end
end
