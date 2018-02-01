class CreateCalculations < ActiveRecord::Migration[5.1]
  def change
    create_table :calculations do |t|
      t.integer :player_id
      t.integer :bet_id
      t.integer :total_point
      t.integer :team_winner_point
      t.integer :score_point

      t.timestamps
    end
  end
end
