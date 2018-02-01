class AddResultToBets < ActiveRecord::Migration[5.1]
  def change
    add_column :bets , :result , :integer
  end
end
