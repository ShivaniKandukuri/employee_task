class Addidcardstoorganization < ActiveRecord::Migration[6.0]
  def change
    add_reference :idcards, :organization,foreign_key:true
  end
end
