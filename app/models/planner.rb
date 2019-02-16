class Planner < ActiveRecord::Base

  belongs_to :baby
	# has_many :users, through: :babies

end
