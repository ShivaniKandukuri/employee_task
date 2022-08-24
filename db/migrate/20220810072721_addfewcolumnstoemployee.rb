class Addfewcolumnstoemployee < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :dateofjoining, :date
    add_column :employees, :address, :text
    add_column :employees, :mobilenumber, :integer
  end
end
