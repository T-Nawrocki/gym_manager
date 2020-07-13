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

get "/member/:id" do
    @member = Member.find(params["id"])
    erb(:"members/show")
end

post "/members-list" do
    new_member = Member.new(params)
    new_member.save
end
