require "sinatra"
require "sinatra/contrib/all"
require_relative "../models/gym_class"
also_reload("../models/*")

get "/class-list" do
    @gym_classes = GymClass.all
    erb(:"gym_classes/index")
end
