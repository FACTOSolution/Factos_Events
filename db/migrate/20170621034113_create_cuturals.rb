class CreateCuturals < ActiveRecord::Migration[5.1]
  def change
    create_table :cuturals do |t|

      t.timestamps
    end
  end
end
