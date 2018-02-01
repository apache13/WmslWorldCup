class AddLiveToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :live , :string
  end
end
