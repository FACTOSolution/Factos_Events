class AddaTypeToEventsAndDropTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :academics
    drop_table :cuturals
  end
end
