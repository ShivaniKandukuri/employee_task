class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :name
      t.string :picture
      t.references :employee,foreign_key:true

      t.timestamps
    end
  end
end
