class Planner < ActiveRecord::Base

  belongs_to :baby

  #refers to as single terms.
  #planner.babies


  def self.order_newest

    self.order(created_at: :desc)

  end

end
