class AddProcessedToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :processed, :boolean
  end
end
