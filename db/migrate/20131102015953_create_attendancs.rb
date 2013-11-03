class CreateAttendancs < ActiveRecord::Migration
  def change
    create_table :attendancs do |t|
      t.integer :employee_id
      t.datetime :signin_time
      t.datetime :signout_time

      t.timestamps
    end
    add_index :attendancs, :employee_id
  end
end
