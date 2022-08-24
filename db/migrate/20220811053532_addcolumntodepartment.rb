class Addcolumntodepartment < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :added_by,:string
  end
end
