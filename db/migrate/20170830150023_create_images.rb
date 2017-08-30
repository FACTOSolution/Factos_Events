class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :image_url
      t.integer :event_id
      t.timestamps
    end
    add_index :images, :event_id
  end
end
