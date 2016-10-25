require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  "Hi there!"
end

get '/profile/:user' do
  @user = params[:user]
  erb :profile
end

get '/about' do
  @name = 'Shantum'
  erb :about
end

get '/:user' do
  params[:user]
end
