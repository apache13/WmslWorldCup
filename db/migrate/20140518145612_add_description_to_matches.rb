class AddDescriptionToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :description, :string
  end
end
