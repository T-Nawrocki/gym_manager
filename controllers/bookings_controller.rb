require "sinatra"
require "sinatra/contrib/all"
require_relative "../models/booking"
also_reload("../models/*")


get "/booking/new" do
    erb(:"bookings/new")
end

post "/booking/new" do
    booking = Booking.new(params)
    booking.save
    redirect "/"
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
