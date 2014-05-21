class CreateJakkrits < ActiveRecord::Migration
  def change
    create_table :jakkrits do |t|
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
