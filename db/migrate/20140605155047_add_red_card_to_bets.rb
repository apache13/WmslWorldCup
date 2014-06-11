class AddRedCardToBets < ActiveRecord::Migration
  def change
    add_column :bets , :red_card , :boolean
  end
end
