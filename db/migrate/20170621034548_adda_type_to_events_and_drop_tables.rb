class AddaTypeToEventsAndDropTables < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :type, :string
    drop_table :academics
    drop_table :cuturals
  end
end
