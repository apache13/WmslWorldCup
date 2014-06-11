class AddYellowCardToBets < ActiveRecord::Migration
  def change
    add_column :bets , :yellow_card , :boolean
  end
end
