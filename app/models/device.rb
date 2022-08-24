class Device < ApplicationRecord
  has_many :employees
  belongs_to :organization
end
