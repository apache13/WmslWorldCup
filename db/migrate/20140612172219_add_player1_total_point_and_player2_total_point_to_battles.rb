class AddPlayer1TotalPointAndPlayer2TotalPointToBattles < ActiveRecord::Migration
  def change
    add_column :battles , :player1_total_point , :integer
    add_column :battles , :player2_total_point , :integer
  end
end
