class AddCloseToBets < ActiveRecord::Migration[5.1]
  def change
    add_column :bets, :close, :boolean
  end
end
