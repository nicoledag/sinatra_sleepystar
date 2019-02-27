
nicole = User.create(username: "Nicole", password: "hello767")
sara = User.create(username: "Sara", password: "whatsup944")

julie = Baby.create(name: "Julie", user_id: nicole.id)
alec = Baby.create(name: "Alec", user_id: nicole.id)
kristi = Baby.create(name: "Kristi", user_id: sara.id)

JulieMonday = Planner.create(date: "2019-2-11", day: "Monday", wake_time: "8am", bed_time: "8pm", baby_id: julie.id)
JulieTuesday = Planner.create(date: "2019-2-12", day: "Tuesday", wake_time: "8:30am", bed_time: "8:30pm", baby_id: julie.id)

AlecMonday = Planner.create(day: "Monday", wake_time: "7:30am", bed_time: "8pm", baby_id: alec.id)
AlecTuesday = Planner.create(day: "Tuesday", wake_time: "7:30am", bed_time: "8pm", baby_id: alec.id)

KristiMonday = Planner.create(day: "Monday", wake_time: "6:30am", bed_time: "7pm", baby_id: kristi.id)
KristiTuesday = Planner.create(day: "Tuesday", wake_time: "6:30am", bed_time: "7pm", baby_id: kristi.id)

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
