class AddResultToBattles < ActiveRecord::Migration[5.1]
  def change
    add_column :battles , :result , :integer
  end
end
