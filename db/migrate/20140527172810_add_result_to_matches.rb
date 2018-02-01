class AddResultToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches , :result , :integer
  end
end
