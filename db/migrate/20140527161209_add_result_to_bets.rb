class AddResultToBets < ActiveRecord::Migration
  def change
    add_column :bets , :result , :integer
  end
end
