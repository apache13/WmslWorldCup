class RenameProcessedToReady < ActiveRecord::Migration
  def change
    rename_column :matches, :processed, :ready
  end
end
