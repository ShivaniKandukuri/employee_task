class AddDeviceRefereencetoemployees < ActiveRecord::Migration[6.0]
  def change
    add_reference :employees, :device, foreign_key: true
  end
end
