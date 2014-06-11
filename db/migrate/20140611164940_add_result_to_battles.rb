class AddResultToBattles < ActiveRecord::Migration
  def change
    add_column :battles , :result , :integer
  end
end
