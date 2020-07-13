require "sinatra"
require "sinatra/contrib/all"
require_relative "../models/gym_class"
also_reload("../models/*")


get "/class-list" do
    @gym_classes = GymClass.all
    erb(:"gym_classes/index")
end


get "/class/new" do
    erb(:"gym/classes/new")
end

post "/class/new" do
end


get "/class/:id" do
    @gym_class = GymClass.find(params["id"])
    erb(:"gym_classes/show")
end

