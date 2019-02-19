class User < ActiveRecord::Base

  has_secure_password
	has_many :babies
  #user.babies

	has_many :planners, through: :babies
  #user.babies.planners
end
