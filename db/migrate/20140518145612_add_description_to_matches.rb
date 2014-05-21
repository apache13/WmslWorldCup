class AddDescriptionToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :description, :string
  end
end
