class AddEventIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :event_id, :integer
    add_index :comments, :event_id
  end
end
