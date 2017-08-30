class AddEventIdToImageEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :event_id, :integer
    add_index :events, :event_id
  end
end
