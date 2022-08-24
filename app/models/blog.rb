class Blog < ApplicationRecord
  has_many :likes
  has_many:employees,through: :likes
  has_many :comments
  has_many:employees,through: :comments
  def liked?(employee)
    !!self.likes.find{|w| w.employee_id==employee.id}
  end
end
