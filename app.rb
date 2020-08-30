require "sinatra"
require "sinatra/contrib/all"
require_relative "controllers/members_controller"
require_relative "controllers/gym_classes_controller"
require_relative "controllers/bookings_controller"
require_relative "controllers/sessions_controller"
require_relative "controllers/errors_controller"
require_relative "models/quote"

get "/" do
    @quote = Quote.random_quote
    @name = Quote.random_name
    erb(:index)
end
