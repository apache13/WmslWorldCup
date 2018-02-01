class AddPlayersToTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :player_id, :integer
  end
end
