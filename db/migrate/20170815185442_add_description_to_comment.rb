class AddDescriptionToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :description, :text
  end
end
