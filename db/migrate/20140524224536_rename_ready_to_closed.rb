class RenameReadyToClosed < ActiveRecord::Migration
  def change
    rename_column :matches, :ready, :closed
  end
end
