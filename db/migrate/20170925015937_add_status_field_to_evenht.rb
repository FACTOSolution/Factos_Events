class AddStatusFieldToEvenht < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :event_status, :integer
  end
end
