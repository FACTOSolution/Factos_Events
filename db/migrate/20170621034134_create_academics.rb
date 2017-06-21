class CreateAcademics < ActiveRecord::Migration[5.1]
  def change
    create_table :academics do |t|

      t.timestamps
    end
  end
end
