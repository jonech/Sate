class AddLatLongToEvent < ActiveRecord::Migration
  def change
    add_column :events, :lat, :int
    add_column :events, :long, :int
  end
end
