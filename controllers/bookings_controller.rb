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
