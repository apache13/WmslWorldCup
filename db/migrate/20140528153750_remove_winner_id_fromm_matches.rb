class RemoveWinnerIdFrommMatches < ActiveRecord::Migration[5.1]
  def change
    remove_column :matches , :winner_id
  end
end
