require_relative "../models/member"
require_relative "../models/gym_class"
require_relative "../models/booking"


Member.delete_all
GymClass.delete_all
Booking.delete_all


member1 = Member.new({
    "first_name" => "Hinata",
    "last_name" => "Shoyo",
    "preferred_name" =>"Shoyo",
    "age" => "15",
    "join_date" => "10 Jul 2020"
    })
member2 = Member.new({
    "first_name" => "Tsukishima",
    "last_name" => "Kei",
    "age" => "15",
    "join_date" => "10 Jul 2020"
    })

member1.save
member2.save


class1 = GymClass.new({
    "name" => "Volleyball",
    "trainer_name" => "Ukai",
    "available_times" => "{Mon 12:30,Tue 15:45,Sat 18:00}"
})
class2 = GymClass.new({
    "name" => "HIIT",
    "trainer_name" => "Washijo"
})

class1.save
class2.save


booking1 = Booking.new({
    "member_id" => member1.id,
    "gym_class_id" => class1.id,
    "time" => class1.available_times[0]
})
booking2 = Booking.new({
    "member_id" => member2.id,
    "gym_class_id" => class1.id,
    "time" => class1.available_times[1]
})

booking1.save
booking2.save
