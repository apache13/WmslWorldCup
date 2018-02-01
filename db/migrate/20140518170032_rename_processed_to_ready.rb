class RenameProcessedToReady < ActiveRecord::Migration[5.1]
  def change
    rename_column :matches, :processed, :ready
  end
end
