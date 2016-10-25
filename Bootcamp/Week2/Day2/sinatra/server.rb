require 'sinatra'

get '/' do
  "Hi there!"
end

get '/about' do
  @name = 'Gorka'
  erb :about
end
