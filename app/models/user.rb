class User < ActiveRecord::Base

  has_secure_password
	has_many :babies
	has_many :planners, through: :babies

end