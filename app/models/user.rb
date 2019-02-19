class User < ActiveRecord::Base

  has_secure_password
	has_many :babies
  #parent class
  #user.babies

	has_many :planners, through: :babies
  #parent class
  #user.babies.planners
end
