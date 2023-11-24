class AddTypeToBoats < ActiveRecord::Migration[7.1]
  def change
    add_column :boats, :boat_type, :string
  end
end
