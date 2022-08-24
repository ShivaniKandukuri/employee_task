class AddTeamReferenceToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_reference :employees, :team, foreign_key: true
  end
end
