require "sinatra"
require "sinatra/contrib/all"
require_relative "../models/session"
also_reload("../models/*")


get "/class/:id/sessions" do
    @class = GymClass.find(params["id"])
    erb(:"sessions/new")
end

post "/class/:id/sessions" do
    new_session = Session.new(params)
    session.save
    redirect "/class/#{new_session.gym_class_id}/sessions"
end

post "/session/:id/delete" do
    session = Session.new(params["id"])
    session.delete
    redirect "/class/#{session.gym_class_id}/sessions"
end
