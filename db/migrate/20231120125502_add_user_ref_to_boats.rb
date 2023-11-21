class AddUserRefToBoats < ActiveRecord::Migration[7.1]
  def change
    add_reference :boats, :user, null: false, foreign_key: true
  end
end
