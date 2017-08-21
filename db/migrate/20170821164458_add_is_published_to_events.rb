class AddIsPublishedToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :published, :boolean, default: false
  end
end
