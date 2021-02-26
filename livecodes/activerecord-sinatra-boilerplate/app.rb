require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

# HTTP Verbs
# GET, POST, PATCH, DELETE

get "/" do
  @restaurants = Restaurant.all
  erb :index
end

get '/restaurants/:id' do
  id = params[:id]
  @restaurant = Restaurant.find(id)
  erb :show
end

post '/restaurants' do
  name = params[:name]
  city = params[:city]
  restaurant = Restaurant.new(name: name, city: city)
  restaurant.save
  redirect '/'
end
