class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.references :organization ,foreign_key:true
      t.timestamps
    end
  end
end
