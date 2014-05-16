class AddPlayerIdToBets < ActiveRecord::Migration
  def change
    add_column :bets, :player_id, :integer
  end
end
