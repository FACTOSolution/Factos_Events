class AddLatLongToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :lat, :decimal
    add_column :events, :long, :decimal
    remove_column :events, :event_id
  end
end
