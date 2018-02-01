class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.datetime :match
      t.integer :team1_id
      t.integer :team2_id
      t.integer :team1_score
      t.integer :team2_score

      t.timestamps
    end
  end
end
