class Addreferencemodelstopayslip < ActiveRecord::Migration[6.0]
  def change
    add_reference :payslips, :organization,foreign_key:true
    add_reference :payslips, :employee,foreign_key:true
  end
end
