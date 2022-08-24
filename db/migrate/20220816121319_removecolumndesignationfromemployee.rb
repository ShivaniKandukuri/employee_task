class Removecolumndesignationfromemployee < ActiveRecord::Migration[6.0]
  def change
    remove_column :employees, :designation, :string
  end
end
