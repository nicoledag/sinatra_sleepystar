
nicole = User.create(username: "Nicole", password: "hello767")
sara = User.create(username: "Sara", password: "whatsup944")

julie = Baby.create(name: "Julie", age: "15 months")
alec = Baby.create(name: "Alec", age: "6 months")
kristi = Baby.create(name: "Kristi", age: "6 months")

julie_monday = Planner.create(day: "Monday", wake_time: "8am", bed_time: "8pm")
julie_tuesday = Planner.create(day: "Tuesday", wake_time: "8:30am", bed_time: "8:30pm")

alec_monday = Planner.create(day: "Monday", wake_time: "7:30am", bed_time: "8pm")
alec_tuesday = Planner.create(day: "Tuesday", wake_time: "7:30am", bed_time: "8pm")

kristi_monday = Planner.create(day: "Monday", wake_time: "6:30am", bed_time: "7pm")
kristi_tuesday = Planner.create(day: "Tuesday", wake_time: "6:30am", bed_time: "7pm")
