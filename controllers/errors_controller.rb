require "sinatra"
require "sinatra/contrib/all"
require_relative "../models/booking"
also_reload("../models/*")

get "/error/invalid-data" do
    erb(:"errors/invalid_data")
end
