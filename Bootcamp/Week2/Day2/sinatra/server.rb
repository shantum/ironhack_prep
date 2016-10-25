require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  "Hi there!"
end

get '/about' do
  @name = 'Gorka'
  erb :about
end

get '/:user' do
  @user = params[:user]
end
