
nicole = User.create(username: "Nicole", password: "hello767")
sara = User.create(username: "Sara", password: "whatsup944")

JulieBaby.create(name: "Julie", age: "15 months", user_id: nicole.id)
AlecBaby.create(name: "Alec", age: "6 months", user_id: nicole.id)
KristiBaby.create(name: "Kristi", age: "6 months", user_id: sara.id)

JulieMondayPlanner.create(date: "2019-2-11", day: "Monday", wake_time: "8am", bed_time: "8pm", baby_id: julie.id)
JulieTuesdayPlanner.create(date: "2019-2-12", day: "Tuesday", wake_time: "8:30am", bed_time: "8:30pm", baby_id: julie.id)

AlecMondayPlanner.create(day: "Monday", wake_time: "7:30am", bed_time: "8pm", baby_id: alec.id)
AlecTuesdayPlanner.create(day: "Tuesday", wake_time: "7:30am", bed_time: "8pm", baby_id: alec.id)

KristiMondayPlanner.create(day: "Monday", wake_time: "6:30am", bed_time: "7pm", baby_id: kristi.id)
KristiTuesdayPlanner.create(day: "Tuesday", wake_time: "6:30am", bed_time: "7pm", baby_id: kristi.id)

# User
# has_many :babies
# #parent class
# #user.babies

# has_many :planners, through: :babies
# #parent class
# #user.babies.planners

# Baby
# belongs_to :user (user_id)
# #refered to as single term
# #baby.users
# has_many :planners
# #parent class
# # baby.planners


# Planner
# belongs_to :baby (baby_id)
#refers to as single terms.
#planner.babies
