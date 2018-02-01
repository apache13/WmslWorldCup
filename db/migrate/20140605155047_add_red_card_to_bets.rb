class AddRedCardToBets < ActiveRecord::Migration[5.1]
  def change
    add_column :bets , :red_card , :boolean
  end
end
