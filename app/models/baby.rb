class Baby < ActiveRecord::Base

  belongs_to :user
  #refered to as single term
  #baby.users
	has_many :planners
  #parent class
  # baby.planners

end
