class Addorganizationtoblog < ActiveRecord::Migration[6.0]
  def change
    add_reference :blogs, :organization,  foreign_key: true
  end
end
