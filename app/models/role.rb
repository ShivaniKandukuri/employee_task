class Role < ApplicationRecord
  has_many :employees
  belongs_to :organization
end
