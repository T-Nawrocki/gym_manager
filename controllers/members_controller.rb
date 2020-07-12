require "sinatra"
require "sinatra/contrib/all"
require_relative "../models/member"
also_reload("../models/*")

get "/members-list" do
    @members = Member.all
    erb(:"members/index")
end

get "/member/:id" do
    @member = Member.find(params["id"])
    erb(:"members/show")
end
