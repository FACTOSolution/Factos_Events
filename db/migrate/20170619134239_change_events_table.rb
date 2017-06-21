class ChangeEventsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :name, :string
    add_column :events, :description, :text
    add_column :events, :value_in_real, :decimal
    add_column :events, :contact, :string
    add_column :events, :cover_data, :text
    add_column :events, :date, :datetime
    add_column :events, :address, :string
  end
end
