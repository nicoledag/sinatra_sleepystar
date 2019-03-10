class Planner < ActiveRecord::Base

  belongs_to :baby

  #refers to as single terms.
  #planner.babies


  def convert_times_to_24_hours

    hour = "10:30".split(/:\w\w/)
    minute = "10:30".split(/\w\w:/)

  end

  # Convert both times to 24 hour format, adding 12 to all pm hours
  # 9:07am becomes 9:07 hours (start time)
  # 3:42pm becomes 15:42 hours (end time)
  # If the start minutes are greater than the end minutes…
  # Subtract 1 hour from the end time hours – not applicable to this example
  # Add 60 minutes to the end minutes – not applicable to this example
  # Subtract end time minutes from start time minutes…
  # 42 – 07 = 35 minutes
  # Subtract the hours…
  # 9 – 3 = 6 hours
  # Put(not add) the hours and minutes together – 6:45 (6 hours and 45 minutes)
  # Here is an example where the start minutes are greater than the end minutes – 8:55am to 3:42pm
  # Convert both times to 24 hour format, adding 12 to any pm hours
  # 8:55am becomes 8:55 hours (start time)
  # 3:42pm becomes 15:42 hours (end time) <- 12 added
  # If the start minutes are greater than the end minutes…
  # Subtract 1 hour from the end time hours – 15:42 becomes 14:42
  # Add 60 minutes to the end minutes – 14:42 becomes 14:102
  # Subtract end time minutes from start time minutes…
  # 102 – 55 = 47 minutes
  # Subtract the hours…
  # 14 - 8 = 6 hours
  # Put(not add) the hours and minutes together – 6:45 (6 hours and 45 minutes)

end
