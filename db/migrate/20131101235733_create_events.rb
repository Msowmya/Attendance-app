class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :employee_id
      t.string :event_name
      t.datetime :start_time

      t.timestamps
    end
    add_index :events, :employee_id
  end
end
