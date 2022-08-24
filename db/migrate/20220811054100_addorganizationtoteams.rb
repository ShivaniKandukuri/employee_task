class Addorganizationtoteams < ActiveRecord::Migration[6.0]
  def change
    add_reference :teams, :organization,  foreign_key: true
  end
end
