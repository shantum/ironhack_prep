require "sinatra"
require "sinatra/reloader" if development?
require_relative "lib/password"

get '/' do
  erb :login
end

post '/login' do
  
end
