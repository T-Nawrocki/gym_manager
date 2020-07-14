require "pry-byebug"
require_relative "../models/member"
require_relative "../models/gym_class"
require_relative "../models/booking"
require_relative "../models/available_time"


Member.delete_all
GymClass.delete_all
AvailableTime.delete_all
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


available_time1 = AvailableTime.new({
    "id" => "1",
    "gym_class_id" => "1",
    "day" => "1",
    "time" => "15:30"
})    
available_time2 = AvailableTime.new({
    "gym_class_id" => "2",
    "day" => "4",
    "time" => "10:00"
})
available_time1.save
available_time2.save


booking1 = Booking.new({
    "member_id" => member1.id,
    "gym_class_id" => class1.id,
    "time_id" => "Mon 15:30"
})
booking2 = Booking.new({
    "member_id" => member2.id,
    "gym_class_id" => class1.id,
    "time_id" => "Thu 10:45"
})

booking1.save
booking2.save


# member1.age = "16"
# member1.update

# class1.name = "Volleyball—Serving"
# class1.update

# booking1.time = "Sat 08:00"
# booking1.update


# member3 = Member.new({
#     "first_name" => "Tsukishima",
#     "last_name" => "Kei",
#     "age" => "15",
#     "join_date" => "10 Jul 2020"
#     })
# class3 = GymClass.new({
#     "name" => "HIIT",
#     "trainer_name" => "Washijo"
# })
# booking3 = Booking.new({
#     "member_id" => member2.id,
#     "gym_class_id" => class1.id,
#     "time" => "Sun 19:00"
# })

# member3.save
# class3.save
# booking3.save

# member3.delete
# class3.delete
# booking3.delete

binding.pry
nil
