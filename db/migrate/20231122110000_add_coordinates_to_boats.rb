class AddCoordinatesToBoats < ActiveRecord::Migration[7.1]
  def change
    add_column :boats, :latitude, :float
    add_column :boats, :longitude, :float
  end
end
