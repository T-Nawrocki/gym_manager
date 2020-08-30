require_relative "../models/member"
require_relative "../models/gym_class"
require_relative "../models/booking"
require_relative "../models/session"


Member.delete_all
GymClass.delete_all
Session.delete_all
Booking.delete_all


member1 = Member.new({
    "first_name" => "Hinata",
    "last_name" => "Shoyo",
    "preferred_name" =>"Shoyo",
    "age" => "15",
    "join_date" => "2020-07-14"
    })
member2 = Member.new({
    "first_name" => "Tsukishima",
    "last_name" => "Kei",
    "age" => "15",
    "join_date" => "2020-07-14"
    })

member1.save
member2.save


class1 = GymClass.new({
    "name" => "Volleyball",
    "trainer_name" => "Ukai",
})
class2 = GymClass.new({
    "name" => "HIIT",
    "trainer_name" => "Washijo"
})

class1.save
class2.save


session1 = Session.new({
    "gym_class_id" => class1.id,
    "day" => "1",
    "time" => "15:30"
})    
session2 = Session.new({
    "gym_class_id" => class2.id,
    "day" => "4",
    "time" => "10:00"
})

session1.save
session2.save


booking1 = Booking.new({
    "member_id" => member1.id,
    "gym_class_id" => class1.id,
    "session_id" => session1.id
})
booking2 = Booking.new({
    "member_id" => member2.id,
    "gym_class_id" => class1.id,
    "session_id" => session1.id
})

booking1.save
booking2.save
