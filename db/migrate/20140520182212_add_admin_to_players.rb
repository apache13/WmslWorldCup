class AddAdminToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :admin , :boolean
  end
end
