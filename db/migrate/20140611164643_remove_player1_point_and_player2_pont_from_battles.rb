class RemovePlayer1PointAndPlayer2PontFromBattles < ActiveRecord::Migration[5.1]
  def change
    remove_column :battles , :player1_point
    remove_column :battles , :player2_point
  end
end
