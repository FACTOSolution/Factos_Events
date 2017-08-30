class DropImagEventTableAddEventIdToImage < ActiveRecord::Migration[5.1]
  def change
    drop_table :image_events
  end
end
