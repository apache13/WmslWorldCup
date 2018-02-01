class AddPlayerIdToBets < ActiveRecord::Migration[5.1]
  def change
    add_column :bets, :player_id, :integer
  end
end
