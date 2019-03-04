As a user, I can…
Sign up, log in and log out of the application.
Create, edit, view and delete a baby.
Create, edit, view and delete a babies sleep planner.

class User
has_secure_password
has_many babies

:username, :password_digest

class Baby
belongs_to a user
has_many planners

:name, :user_id

Class Planner
belongs_to a baby

:date, :wake_time, :bed_time, :morning_nap_start_time, :morning_nap_end_time, :midday_nap_start_time, :midday_nap_end_time,
:late_afternoon_nap_start_time, :late_afternoon_nap_end_time, :notes, :baby_id


Stretch Goals

1) Return additional information to user such as shortest and longest nap for the past 7 days.  
2) Add graphic art design and css styling.
3) Display validation failures to user with error messages.
4) Add slug
