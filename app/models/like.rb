class Like < ApplicationRecord
  belongs_to :employee
  belongs_to :blog
  validates :employee_id, uniqueness: { scope: :blog_id }
end
