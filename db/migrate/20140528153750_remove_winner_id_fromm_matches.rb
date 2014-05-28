class RemoveWinnerIdFrommMatches < ActiveRecord::Migration
  def change
    remove_column :matches , :winner_id
  end
end
