class CreatePayslips < ActiveRecord::Migration[6.0]
  def change
    create_table :payslips do |t|
      t.integer :takehome
      t.integer :deductions
      t.integer :grosspay

      t.timestamps
    end
  end
end
