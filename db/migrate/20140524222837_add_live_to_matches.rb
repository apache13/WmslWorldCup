class AddLiveToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :live , :string
  end
end
