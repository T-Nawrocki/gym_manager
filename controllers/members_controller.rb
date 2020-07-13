require "sinatra"
require "sinatra/contrib/all"
require_relative "../models/member"
also_reload("../models/*")


get "/members-list" do
    @members = Member.all
    erb(:"members/index")
end


get "/member/new" do
    erb(:"members/new")
end

post "/member/new" do
    new_member = Member.new(params)
    new_member.save
    redirect "/members-list"
end


get "/member/:id" do
    @member = Member.find(params["id"])
    erb(:"members/show")
end


post "/member/:id/delete" do
    member = Member.find(params["id"])
    member.delete
    redirect "/members-list"
end
