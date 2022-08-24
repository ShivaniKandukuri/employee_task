class Comment < ApplicationRecord
  belongs_to :blog
  belongs_to :employee
  validates :employee_id, uniqueness: { scope: :blog_id }
end
