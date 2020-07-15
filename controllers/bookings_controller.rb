require "sinatra"
require "sinatra/contrib/all"
require_relative "../models/booking"
require_relative "../helpers/helper"
also_reload("../models/*")


get "/booking/new" do
    erb(:"bookings/new")
end

post "/booking/new" do
    if Helper.all_answered?(params)
        # @member = Member.find(params["member_id"])
        # @gym_class = GymClass.find(params["gym_class_id"])
        redirect "/booking/#{params["member_id"]}/#{params["gym_class_id"]}"
    else
        redirect "/error/invalid-data"
    end
end

get "/booking/:member_id/:gym_class_id" do
    @member_id = params["member_id"]
    @gym_class = GymClass.find(params["gym_class_id"])
    erb(:"/bookings/new2")
end

post "/booking/:member_id/:gym_class_id" do
    binding.pry
    if Helper.all_answered?(params)
        booking = Booking.new(params)
        booking.save
        redirect "/"
    else
        redirect "/error/invalid-data"
    end
end


post "/booking/:id/delete" do
    booking = Booking.find(params["id"])
    booking.delete
    redirect "/"
end


get "/booking/:id/edit" do
    @booking = Booking.find(params["id"])
    erb(:"bookings/edit")
end

post "/booking/:id/edit" do
    if Helper.all_answered?(params)
        edited_booking = Booking.new(params)
        edited_booking.update
        redirect "/"
    else
        redirect "/error/invalid-data"
    end
end
