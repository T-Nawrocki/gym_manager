require_relative "../models/member"

Member.delete_all

member1 = Member.new({
    "id" => "1",
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
