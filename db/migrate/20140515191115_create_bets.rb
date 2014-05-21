class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :match_id
      t.integer :team1_score
      t.integer :team2_score

      t.timestamps
    end
  end
end
