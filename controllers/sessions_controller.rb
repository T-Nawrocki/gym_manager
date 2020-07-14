require "sinatra"
require "sinatra/contrib/all"
require_relative "../models/session"
also_reload("../models/*")


get "/class/:id/sessions" do
    @gym_class = GymClass.find(params["id"])
    erb(:"sessions/new")
end

post "/class/:gym_class_id/sessions" do
    binding.pry
    new_session = Session.new(params)
    new_session.save
    redirect "/class/#{new_session.gym_class_id}/sessions"
end

post "/session/:id/delete" do
    session = Session.new(params["id"])
    session.delete
    redirect "/class/#{session.gym_class_id}/sessions"
end
