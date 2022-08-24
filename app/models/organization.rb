class Organization < ApplicationRecord
  has_many :employees
  has_many :devices
  has_many :teams
  has_many :blogs
  has_many :idcards
  has_many :payslips
  has_many :roles
end
