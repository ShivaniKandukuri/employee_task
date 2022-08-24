class Addcolumnstopayslip < ActiveRecord::Migration[6.0]
  def change
    add_column :payslips,:house_rent,:integer
    add_column :payslips,:basic,:integer
    add_column :payslips,:conveyence,:integer
    add_column :payslips,:fixed,:integer
    add_column :payslips,:medical,:integer
    add_column :payslips,:professional_tax,:integer
    add_column :payslips,:epf_contribution,:integer
  end
end
