class RenameCollumnsValueCover < ActiveRecord::Migration[5.1]
  def change
    rename_column :events, :value_in_real, :value
    rename_column :events, :cover_data, :image_url
  end
end
