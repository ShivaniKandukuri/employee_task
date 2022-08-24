class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :designation
      t.integer :salary
      t.integer :age
      t.string :gender
      t.timestamps
    end
  end
end
