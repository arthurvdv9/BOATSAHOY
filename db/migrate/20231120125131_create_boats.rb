class CreateBoats < ActiveRecord::Migration[7.1]
  def change
    create_table :boats do |t|
      t.string :location
      t.string :name
      t.integer :capacity
      t.float :price

      t.timestamps
    end
  end
end
