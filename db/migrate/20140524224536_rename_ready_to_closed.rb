class RenameReadyToClosed < ActiveRecord::Migration[5.1]
  def change
    rename_column :matches, :ready, :closed
  end
end
