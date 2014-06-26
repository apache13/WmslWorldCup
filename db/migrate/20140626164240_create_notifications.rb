class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :topic
      t.text :message
      t.integer :player_id
      t.boolean :closed

      t.timestamps
    end
  end
end
