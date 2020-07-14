require "sinatra"
require "sinatra/contrib/all"
require_relative "../models/booking"
require_relative "../helpers/helper"
also_reload("../models/*")


get "/booking/new" do
    erb(:"bookings/new")
end

post "/booking/new" do
    binding.pry  # TODO REMOVE
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
    edited_booking = Booking.new(params)
    edited_booking.update
    redirect "/"
end
