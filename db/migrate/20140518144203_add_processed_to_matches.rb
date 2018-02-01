class AddProcessedToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :processed, :boolean
  end
end
