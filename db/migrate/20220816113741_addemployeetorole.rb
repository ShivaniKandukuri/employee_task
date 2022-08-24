class Addemployeetorole < ActiveRecord::Migration[6.0]
  def change
    add_reference :employees,:role,foreign_key:true
  end
end
