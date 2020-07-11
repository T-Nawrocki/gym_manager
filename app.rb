require "sinatra"
require "sinatra/contrib/all"
require_relative "controllers/members"
require_relative "controllers/gym_classes"
require_relative "controllers/bookings"

get "/" do
    erb(:index)
end
