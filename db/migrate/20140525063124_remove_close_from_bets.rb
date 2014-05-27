class RemoveCloseFromBets < ActiveRecord::Migration
  def change
    remove_column :bets, :close
  end
end
