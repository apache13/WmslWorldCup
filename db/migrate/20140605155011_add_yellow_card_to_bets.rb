class AddYellowCardToBets < ActiveRecord::Migration[5.1]
  def change
    add_column :bets , :yellow_card , :boolean
  end
end
