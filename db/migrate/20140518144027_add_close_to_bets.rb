class AddCloseToBets < ActiveRecord::Migration
  def change
    add_column :bets, :close, :boolean
  end
end
