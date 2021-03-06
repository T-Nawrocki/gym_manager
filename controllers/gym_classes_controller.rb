require "sinatra"
require "sinatra/contrib/all"
require_relative "../models/gym_class"
also_reload("../models/*")


get "/class-list" do
    @gym_classes = GymClass.all
    erb(:"gym_classes/index")
end


get "/class/new" do
    erb(:"gym_classes/new")
end

post "/class/new" do
    new_class = GymClass.new(params)
    new_class.save
    redirect "/class/#{new_class.id}/sessions"
end


get "/class/:id" do
    @gym_class = GymClass.find(params["id"])
    erb(:"gym_classes/show")
end


post "/class/:id/delete" do
    gym_class = GymClass.find(params["id"])
    gym_class.delete
    redirect "/class-list"
end


get "/class/:id/edit" do
    @gym_class = GymClass.find(params["id"])
    erb(:"gym_classes/edit")
end

post "/class/:id/edit" do
    edited_class = GymClass.new(params)
    edited_class.update
    redirect "/class/#{edited_class.id}"
end
