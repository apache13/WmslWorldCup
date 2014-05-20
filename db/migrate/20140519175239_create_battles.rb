class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.integer :match_id
      t.integer :player1_id
      t.integer :player2_id
      t.integer :player1_point
      t.integer :player2_point

      t.timestamps
    end
  end
end
