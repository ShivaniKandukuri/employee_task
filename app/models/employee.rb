class Employee < ApplicationRecord
  before_save { self.email = email.downcase }

  validates :first_name,presence:true
  validates :last_name,presence:true
  validates :designation,presence:true,inclusion: { in: %w(admin employee) }
  validates :salary,presence:true,numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :age,presence:true,numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :gender,presence:true,inclusion: { in: %w(male female) }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create },presence: true
  validates :password, :presence => true,
                      :confirmation => true,
                      :length => {:within => 6..40},
                      :on => :create
 validates :mobilenumber,:presence => true,
                                     :numericality => true,
                                     :length => { :minimum => 10, :maximum => 15 }

  belongs_to :organization
  belongs_to :device
  belongs_to :team
  has_many:likes
  has_many:blogs,through: :likes
  has_one :image
  has_one :idcard
  belongs_to :role
  has_one :payslip
  has_many :comments
  has_many:blogs,through: :comments
  
  has_secure_password

end
