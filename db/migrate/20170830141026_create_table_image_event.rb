class CreateTableImageEvent < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :image_url, :text
    create_table :image_events do |t|
      t.string :image_url
    end
  end
end
